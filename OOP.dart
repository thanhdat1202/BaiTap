import 'dart:io';

void main() {
  List<Student> students = [];
  List<Teacher> teachers = [];
  List<Classroom> classrooms = [];

  while(true){
    print("1. Thêm sinh viên");
    print("2. Thêm giảng viên");
    print("3. Tạo lớp học");
    print("4. Thêm giảng viên vào lớp học");
    print("5. Thêm sinh viên vào lớp học");
    print("6. Hiển thị danh sách lớp");
    print("7. Thoát");
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Nhập ID sinh viên: ");
        int id = int.parse(stdin.readLineSync()!);
        stdout.write("Nhập tên sinh viên: ");
        String name = stdin.readLineSync()!;        
        stdout.write("Nhập tuổi sinh viên: ");
        int age = int.parse(stdin.readLineSync()!);        
        stdout.write("Chọn giới tính: ");
        String gender = stdin.readLineSync()!;
        stdout.write("Nhập khối: ");
        int grade = int.parse(stdin.readLineSync()!);
        stdout.write("Nhập điểm: ");
        double score = double.parse(stdin.readLineSync()!);
        students.add(Student(id, name, age, gender, grade, score));
        break;
      case '2':
        stdout.write("Nhập ID giảng viên: ");
        int id = int.parse(stdin.readLineSync()!);
        stdout.write("Nhập tên giảng viên: ");
        String name = stdin.readLineSync()!;        
        stdout.write("Nhập tuổi giảng viên: ");
        int age = int.parse(stdin.readLineSync()!);        
        stdout.write("Chọn giới tính: ");
        String gender = stdin.readLineSync()!;
        stdout.write("Nhập chuyên môn: ");
        String subject = stdin.readLineSync()!;
        stdout.write("Nhập mức lương: ");
        double salary = double.parse(stdin.readLineSync()!);
        teachers.add(Teacher(id, name, age, gender, subject, salary));
        break;
      case '3':
        stdout.write("Nhập ID lớp học: ");
        int id = int.parse(stdin.readLineSync()!);
        stdout.write("Nhập tên lớp học: ");
        String name = stdin.readLineSync()!;
        classrooms.add(Classroom(id, name));
        break;
      case '4':
        print("Giảng viên: ");
        teachers.forEach((t) => print("${t.id}: ${t.name}"));
        stdout.write("Nhập ID giảng viên: ");
        int teacherId = int.parse(stdin.readLineSync()!);

        print("Lớp học:");
        classrooms.forEach((c) => print("${c.id}: ${c.name}"));
        stdout.write("Nhập ID lớp học: ");
        int classId = int.parse(stdin.readLineSync()!);

        Teacher teacher = teachers.firstWhere((t) => t.id == teacherId);
        Classroom classroom = classrooms.firstWhere((c) => c.id == classId);
        classroom.addTeacher(teacher);
        print("Giảng viên đã được thêm vào lớp!");
        break;
      case '5':
        print("Thêm sinh viên:");
        students.forEach((s) => print("${s.id}: ${s.name}"));
        stdout.write("Nhập ID sinh viên: ");
        int studentId = int.parse(stdin.readLineSync()!);

        print("Lớp học:");
        classrooms.forEach((c) => print("${c.id}: ${c.name}"));
        stdout.write("Nhập ID lớp học: ");
        int classId = int.parse(stdin.readLineSync()!);

        Student student = students.firstWhere((s) => s.id == studentId);
        Classroom classroom = classrooms.firstWhere((c) => c.id == classId);
        classroom.addStudent(student);
        print("Sinh viên đã được thêm vào lớp!");
        break;
        
      case '6':
        for (var classroom in classrooms) {
          classroom.displayClassroomInfo();
        }
        break;
      case '7':
        exit(0);
      
      default:
    }
  }


}

class Person {
  int id;
  String name;
  int age;
  String gender;

  Person(this.id, this.name, this.age, this.gender);
}

class Student extends Person {
  int grade;
  double score;

  Student(int id, String name, int age, String gender, this.grade, this.score)
      : super(id, name, age, gender);

  void displayStudent() {
    print(
        "ID sv: $id \nTên sv: $name \nTuổi : $age \nGiới tính: $gender \nLớp : $grade \nĐiểm : $score");
  }
}

class Teacher extends Person {
  String subject;
  double salary;

  Teacher(int id, String name, int age, String gender, this.subject, this.salary)
      : super(id, name, age, gender);

  void displayTeacher() {
    print(
        "ID gv: $id \nTên gv: $name \nTuổi : $age \nGiới tính: $gender \nsubject: $subject \nSalary: $salary");
  }
}

class Classroom {
  var id;
  String? name;
  List<Student> students = [];
  Teacher? teacher;

  Classroom(this.id, this.name);

  void addStudent(Student student){
    students.add(student);
  }

  void addTeacher(Teacher teachers){
    this.teacher = teachers;
  }

  void displayClassroomInfo(){
    print("ClassID: $id");
    print("Classroom: $name");
    print("Teacher: ${teacher?.name ?? 'Không có giáo viên'}");
    print("Students: ");
    for(var student in students){
      student.displayStudent();
    }
  }
}
