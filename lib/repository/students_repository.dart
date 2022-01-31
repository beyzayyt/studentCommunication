class StudentsRepository {
  final students = [
    Student("Beyza", "Yesilyurt", 23, "Female"),
    Student("Elis", "Yesilyurt", 6, "Female"),
  ];

  final Set<Student> iLoved = {};

  void love(Student student, bool amILove) {
    if (amILove) {
      iLoved.add(student);
    }else {
      iLoved.remove(student);
    }
  }

  bool amIlove(Student student) {
    return iLoved.contains(student);
  }
}

class Student {
  late String name;
  late String surname;
  late int age;
  late String sex;

  Student(this.name, this.surname, this.age, this.sex);
}
