f=1:10;
Amp=2*[1 1/5 1/30 1/30 1/40 1/30 1/40 1/40 1/50 1/60]/pi;
Ph=zeros(10,1);
Fs=16e3;
f=262;
T=2;
t=0:1/Fs:T;
sil=zeros(1,Fs*4);

while 1
    Ph2=pi*(rand(10,1)*2-1);
    x=zeros(2,length(t));
    for i=1:10
        x(1,:)=x(1,:)+Amp(i)*sin(2*pi*i*f*t+Ph(i));
        x(2,:)=x(2,:)+Amp(i)*sin(2*pi*i*f*t+Ph2(i));
    end
    figure;plot(t(1:500),x(:,1:500));
    xlabel('time (s)');
    ylabel('Amplitude');
    r=binornd(1,1/2,1,2)+1;
    sound([x(r(1),:) sil x(r(2),:)],Fs);
    if(r(1)==r(2))
        cmp='Yy';
    else
        cmp='Nn';
    end
    inp=input('Were the signals the same [Y/N]? ','s');
    if(strcmp(inp,cmp(1)) || strcmp(inp,cmp(2)))
        disp('Correct!');
    else
        disp('Incorrect :(');
    end
    inp=input('Try again [Y/N]? ','s');
    if(strcmp(inp,'y')||strcmp(inp,'Y'))
        continue;
    else
        break;
    end
end