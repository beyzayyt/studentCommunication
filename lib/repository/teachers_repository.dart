class TeachersRepository {
  List teacher = [
    Teacher("Levent", "Baş", 35, "Male"),
    Teacher("Nermin", "Yılmaz", 35, "Female"),
  ];
}

class Teacher {
  late String name;
  late String surname;
  late int age;
  late String sex;

  Teacher(this.name, this.surname, this.age, this.sex);
}
