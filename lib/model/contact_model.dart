
enum Gender{ FEMALE, MALE }

class Contact {
  final image;
  final firstName;
  final lastName;
  final company;
  final title;
  final mobile;
  final gender;

  Contact(
      {this.image,
      this.firstName,
      this.lastName,
      this.company,
      this.title,
      this.mobile,
      this.gender});
}