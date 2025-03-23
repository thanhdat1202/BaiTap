void main(List<String> args) {}

class Person {
  var id;
  var name;
  var age;
  bool? gender;

  Person(this.id, this.name, this.age, this.gender);
  String getGender() => gender! ? "nam" : "nu";
}

class Student extends Person {
  var grade;
  var score;

  Student(var id, var name, var age, bool gender, this.grade, this.score)
      : super(id, name, age, gender);

  dynamic getter() => {
        "ID: $id, Tên SV: $name, Tuổi: $age, Giới tính: $gender, Lớp: $grade, Điểm: $score"
      };
}

class Teacher extends Person {
  var subject;
  var salary;

  Teacher(var id, var name, var age, bool gender, this.subject, this.salary)
      : super(id, name, age, gender);

  dynamic getInfo() => {
        "ID: $id, Tên GV: $name, Tuổi $age, Giới tính: $gender, Môn: $subject, Lương: $salary"
      };
}

class Classroom {
  var id;
  var name;
  var students;
  var teachers;
}
