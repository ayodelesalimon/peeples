
enum Gender{ FEMALE, MALE }

// Model for the unique contacts
class Contact {
  int id;
  String image;
  String firstName;
  String lastName;
  String company;
  String title;
  String mobile;
  Gender gender;

  Contact(
      {
        this.id, this.image,
      this.firstName,
      this.lastName,
      this.company,
      this.title,
      this.mobile,
      this.gender});

  // Convert contact object into map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['image'] = image;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['company'] = company;
    map['title'] = title;
    map['mobile'] = mobile;
    map['gender'] = gender==Gender.MALE ? 'male' : 'female';
    return map;
  }

  // TODO Extract from any map object
Contact.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.image = map['image'];
    this.firstName = map['first_name'];
    this.lastName = map['last_name'];
    this.lastName = map['first_name'];
    this.company = map['company'];
    this.title = map['title'];
    this.mobile = map['mobile'];
    this.gender = map['gender'] == 'male' ? Gender.MALE : Gender.FEMALE;

}

}