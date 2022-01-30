class StudentsRepository{

  List students = [
    Student("Beyza", "Yesilyurt", 23, "Female"),
    Student("Elis", "Yesilyurt", 6, "Female"),
  ];
}

class Student {
  late String name;
  late String surname;
  late int age;
  late String sex;

  Student(this.name, this.surname, this.age, this.sex);
}