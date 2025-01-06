library(shiny)
library(bslib)
library(plotly)
library(ggplot2)
library(MASS)

ui <- fluidPage(
  theme = bs_theme(version = 4, bootswatch = "minty"),
  titlePanel("Probability Distribution Visualizer"),
  
  sidebarLayout(
    sidebarPanel(
      h3("Select Your Distribution"),
      
      # selectInput(inputId, label, choices,...)
      selectInput(
        "dist_choice",                                                        
        "Choose a Distribution:",
        choices = c("Binomial", "Normal", "Bivariate Normal",'Chi-Squared', "t-Distribution")
      ),
      
      # conditionalPanel(condition, ..., ns = NS(NULL))
      conditionalPanel(
        condition = "input.dist_choice == 'Binomial'",
        numericInput("bin_trials", "Number of Trials (n):", 10, min = 1, max = 100, step = 1),
        numericInput("bin_prob", "Success Probability (p):", 0.5, min = 0, max = 1, step = 0.01)
      ),
      conditionalPanel(
        condition = "input.dist_choice == 'Normal'",
        numericInput("norm_mean", "Mean:", 0),
        numericInput("norm_sd", "Standard Deviation:", 1, min = 0.1, step = 0.01 )
      ),
      conditionalPanel(
        condition = "input.dist_choice == 'Bivariate Normal'",
        numericInput("bv_mean1", "Mean 1 :", 0),
        numericInput("bv_mean2", "Mean 2 :", 0),
        numericInput("bv_sd1", "Standard Deviation 1 :", 1, min = 0.1, step = 0.1),
        numericInput("bv_sd2", "Standard Deviation 2 :", 1, min = 0.1, step = 0.1),
        numericInput("bv_corr", "Correlation :", 0, min = -1, max = 1, step = 0.01)
      ),
      conditionalPanel(
        condition = "input.dist_choice == 'Chi-Squared'",
        numericInput("chi_df", "Degrees of Freedom:", 10, min = 1, max = 10, step = 1)
      ),
      conditionalPanel(
        condition = "input.dist_choice == 't-Distribution'",
        numericInput("t_df", "Degrees of Freedom:", 10, min = 1, max = 10, step = 1)
      ),
      
      ### Line Separation
      hr(),
      
      ### checkboxInput(inputId, label, value = FALSE, width = NULL), actionButtom(inputId, buttomdisplay)
      checkboxInput("keep_history", "Keep Plot History", value = TRUE),
      actionButton("simulate", "Generate Plots"), 
      actionButton("clear", "Clear History")),    
    
    
    
    mainPanel(
      h3("Distribution Plots"),
      tabsetPanel(
        tabPanel("PDF/PMF", plotlyOutput("pdf_plot")),
        tabPanel("CDF", plotlyOutput("cdf_plot")),
        tabPanel("Sample Simulation", verbatimTextOutput("sample_stats")),
        tabPanel("Equations", uiOutput("equation_output"))
      )
    )
  )
)

server <- function(input, output, session) {
  plot_history <- reactiveVal(list())
  color_palette <- reactiveVal(c("red", "blue", "green", "purple", "orange", "cyan", "pink", "brown"))
  
  observeEvent(input$simulate, {
    dist_data <- reactive({
      switch(input$dist_choice,
             "Binomial" = list(
               x = 0:input$bin_trials,
               y = dbinom(0:input$bin_trials, size = input$bin_trials, prob = input$bin_prob)
             ),
             "Normal" = list(
               x = seq(-4, 4, length.out = 1000),
               y = dnorm(seq(-4, 4, length.out = 1000), mean = input$norm_mean, sd = input$norm_sd)
             ),
             "Bivariate Normal" = {
               # sequence: mean +- 3*sd
               x_seq <- seq(input$bv_mean1 - 3 * input$bv_sd1, input$bv_mean1 + 3 * input$bv_sd1, length.out = 100)
               y_seq <- seq(input$bv_mean2 - 3 * input$bv_sd2, input$bv_mean2 + 3 * input$bv_sd2, length.out = 100)
               grid <- expand.grid(x = x_seq, y = y_seq)
               mu <- c(input$bv_mean1, input$bv_mean2) # mean vector (rep(0, length = ncol(x)))
               sigma <- matrix(c(input$bv_sd1^2, input$bv_corr * input$bv_sd1 * input$bv_sd2, 
                                 input$bv_corr * input$bv_sd1 * input$bv_sd2, input$bv_sd2^2), 2, 2) # covariance matrix 
               z <- mvtnorm::dmvnorm(grid, mean = mu, sigma = sigma) # dmvnorm(x, mean = rep(0, length = ncol(x)), sigma = diag(ncol(x)),...)
               list(x = grid$x, y = grid$y, z = z)
             },
             "Chi-Squared" = list(
               x = seq(-4, 4, length.out = 1000),
               y = dchisq(seq(-4, 4, length.out = 1000), df = input$chi_df)
             ),
             "t-Distribution" = list(
               x = seq(-4, 4, length.out = 1000),
               y = dt(seq(-4, 4, length.out = 1000), df = input$t_df)
             )
      )
    })
    
    if (input$keep_history) {
      history <- plot_history() # call for current history from reactive val (our dynamic storage) init list()
      history <- c(history, list(dist_data()))
      plot_history(history)
    } else {
      plot_history(list(dist_data()))
    }
  })
  
  observeEvent(input$clear, {
    plot_history(list())
  })
  
  output$pdf_plot <- renderPlotly({
    history <- plot_history()
    colors <- color_palette()
    
    if (input$dist_choice == "Bivariate Normal") {
      # 3D Plot for Bivariate Normal
      data <- history[[length(history)]]
      plot_ly(
        x = unique(data$x), y = unique(data$y), z = matrix(data$z, nrow = length(unique(data$x))),
        type = "surface", colorscale = "Viridis"
      ) %>%
        layout(title = "Bivariate Normal PDF", scene = list(
          xaxis = list(title = "X"),
          yaxis = list(title = "Y"),
          zaxis = list(title = "PDF")
        ))
    } else {
      # 2D Plots for Other Distributions
      plt <- ggplot() +
        labs(
          title = paste(input$dist_choice, "Probability Density/Mass Function"),
          x = ifelse(input$dist_choice == "Binomial", "k", "x"),
          y = "Density/Probability"
        )
      
      for (i in seq_along(history)) {
        data <- history[[i]]
        if (is.list(data)) {
          plt <- plt + geom_line(
            data = data.frame(x = data$x, y = data$y),
            aes(x = x, y = y),
            color = colors[i %% length(colors) + 1],
            alpha = 0.7
          )
        }
      }
      ggplotly(plt)
    }
  })
  
  output$cdf_plot <- renderPlotly({
    history <- plot_history()
    colors <- color_palette()
    plt <- ggplot() +
      labs(
        title = paste(input$dist_choice, "Cumulative Distribution Function"),
        x = ifelse(input$dist_choice == "Binomial", "k", "x"),
        y = "CDF"
      )
    
    for (i in seq_along(history)) {
      data <- history[[i]]
      if (is.list(data)) {
        cdf_y <- cumsum(data$y) / sum(data$y)
        plt <- plt + geom_line(
          data = data.frame(x = data$x, y = cdf_y),
          aes(x = x, y = y),
          color = colors[i %% length(colors) + 1],
          alpha = 0.7
        )
      }
    }
    ggplotly(plt)
  })
  
  output$sample_stats <- renderPrint({
    data <- plot_history()[[length(plot_history())]] 
    if (is.list(data)) summary(data$y)
  })
  
  output$equation_output <- renderUI({
    dist_choice <- input$dist_choice
    equation <- switch(dist_choice,
                       "Binomial" = "$$P(X = k) = \\binom{n}{k} p^k (1 - p)^{n - k}, \\text{where k is the number of successes}$$",
                       "Normal" = "$$f(x) = \\frac{1}{\\sigma\\sqrt{2\\pi}} e^{-\\frac{1}{2} \\left(\\frac{x - \\mu}{\\sigma}\\right)^2}$$",
                       "Bivariate Normal" = "$$f(x, y) = \\frac{1}{2\\pi \\sigma_1 \\sigma_2 \\sqrt{1-\\rho^2}} e^{-\\frac{1}{2(1-\\rho^2)} \\left[\\frac{(x-\\mu_1)^2}{\\sigma_1^2} + \\frac{(y-\\mu_2)^2}{\\sigma_2^2} - \\frac{2\\rho(x-\\mu_1)(y-\\mu_2)}{\\sigma_1\\sigma_2}\\right]}$$",
                       "t-Distribution" = "$$f(x) = \\frac{\\Gamma\\left(\\frac{\\nu + 1}{2}\\right)}{\\sqrt{\\nu\\pi}\\Gamma\\left(\\frac{\\nu}{2}\\right)} \\left(1 + \\frac{x^2}{\\nu}\\right)^{-\\frac{\\nu + 1}{2}}$$"
    )
    withMathJax(equation)
  })
}


shinyApp(ui = ui, server = server)
