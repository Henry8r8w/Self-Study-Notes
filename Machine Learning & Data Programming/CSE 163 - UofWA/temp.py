
class University:
    def __init__(self, name: str, students: list['Student'] | None = None) -> None:
        self.name = name
        self.students = students.copy() if students else [] 

    def enrollments(self) -> list['Student']:
        return sorted(self.students, key=lambda s: s.name) # sort by name attribute using lambda function

    def enroll(self,student: 'Student') -> None:
        self.students.append(student)

uw = University("Udub", [nicole])
print(uw.enrollments()) # print(List of Student Objects)
