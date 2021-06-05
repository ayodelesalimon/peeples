import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peeples/db/database_helper.dart';
import 'package:peeples/model/contact_model.dart';
import 'package:image_picker/image_picker.dart';

class EditContact extends StatefulWidget {
  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  final _formKey = GlobalKey<FormState>();

  DatabaseHelper helper = DatabaseHelper();

  Contact contact = Contact();

  TextEditingController titleController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  File image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      updateImage(image);
    } else {
      print('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.close),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _save();
              }
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  getImage();
                },
                child: CircleAvatar(
                  radius: 36.0,
                  backgroundColor: Colors.grey,
                  child: Container(
                      padding: EdgeInsets.all(8),
                      child: image == null
                          ? Icon(Icons.account_circle_outlined)
                          : Image.file(
                              image,
                            )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  TextFormField(
                    controller: fNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff464646),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff464646)),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8.0),
                                topLeft: Radius.circular(8.0))),
                        hintText: 'First Name',
                        hintStyle: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white )),
                    style: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white ),
                    onChanged: (value) {
                      updateFirstName();
                    },
                  ),
                  TextFormField(
                    controller: lNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff464646),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff464646)),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0))),
                        hintText: 'Last Name',
                        hintStyle: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white )),
                    style: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white ),
                    onChanged: (value) {
                      updateLastName();
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Column(
                children: [
                  TextFormField(
                    controller: companyController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff464646),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff464646)),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8.0),
                                topLeft: Radius.circular(8.0))),
                        hintText: 'Company',
                        hintStyle: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white)),
                    style: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white ),
                    onChanged: (value) {
                      updateCompany();
                    },
                  ),
                  TextFormField(
                    controller: titleController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff464646),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff464646)),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0))),
                        hintText: 'Title',
                        hintStyle: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white )),
                    style: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white ),
                    onChanged: (value) {
                      updateTitle();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: TextFormField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Phone',
                  prefixIcon: Container(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8, left: 8, right: 16),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: Colors.grey))),
                    child: Text(
                      'Mobile',
                      style: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white),
                    ),
                  ),
                  filled: true,
                  fillColor: Color(0xff464646),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff464646)),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintStyle: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white )),
                style: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white ),
                onChanged: (value) {
                  updateMobile();
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
              child: TextFormField(
                // controller: companyController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Container(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8, left: 8, right: 24),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: Colors.grey))),
                    child: Text(
                      'Work',
                      style: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white),
                    ),
                  ),
                  filled: true,
                  fillColor: Color(0xff464646),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff464646)),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintStyle: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white )),
                style: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: TextFormField(
                controller: genderController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  suffixIcon: PopupMenuButton(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value) {
                      updateGender();
                    },
                    itemBuilder: (BuildContext context) {
                      return items.map<PopupMenuItem<String>>((String value) {
                        return PopupMenuItem(child: Text(value), value: value);
                      }).toList();
                    },
                  ),
                  hintText: 'Male',
                  prefixIcon: Container(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8, left: 8, right: 24),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: Colors.grey))),
                    child: Text(
                      'Gender',
                      style: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white),
                    ),
                  ),
                  filled: true,
                  fillColor: Color(0xff464646),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff464646)),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintStyle: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white )),
                style: GoogleFonts.poppins(fontSize: 12.0, color: Colors.white ),
                onChanged: (value) {
                  updateGender();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> items = ['Male', 'female'];

  moveToLastScreen() {
    return Navigator.pop(context, true);
  }

  // Update the title of contact object
  void updateTitle() {
    contact.title = titleController.text;
  }

  // Update the first name of contact object
  void updateFirstName() {
    contact.firstName = fNameController.text;
  }

  void updateLastName() {
    contact.lastName = lNameController.text;
  }

  void updateCompany() {
    contact.company = companyController.text;
  }

  void updateMobile() {
    contact.mobile = mobileController.text;
  }

  void updateGender() {
    contact.gender = genderController.text.toLowerCase() == 'male'
        ? Gender.MALE
        : Gender.FEMALE;
  }

  void updateImage(image) {
    if (image != null) {
      setState(() {
        print('File type ${image.path.toString().split('cache/')[1]}');
        contact.image = image.path.toString();
      });
    } else {
      contact.image = 'assets/images/avatarpic.png';
    }
  }

  // Save data to database
  void _save() async {
    int result;
    if(contact.image == null) {
      contact.image = 'assets/images/avatarpic.png';
    }
    if (contact.id != null) {
      // Case 1: Update operation
      result = await helper.updateContact(contact);
    } else {
      // Case 2: Insert Operation
      result = await helper.insertContact(contact);
    }

    if (result != 0) {
      // Success
      _showAlertDialo('Status', 'Contact Saved Successfully');
    } else {
      // Failure
      _showAlertDialo('Status', 'Problem Saving Todo');
    }
    moveToLastScreen();
  }

  void _delete() async {
    moveToLastScreen();

    if (contact.id == null) {
      _showAlertDialog('Status', 'No Contact was deleted');
      return;
    }

    // Case 2: User is trying to delete the old contact that already has a valid ID.
    int result = await helper.deleteContact(contact.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Todo Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Todo');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void _showAlertDialo(String title, String message) {
    // print('$title == $message');
    // CoolAlert.show(
    //   title: title,
    //   context: context,
    //   type: CoolAlertType.success,
    //   text: message,
    // );
  }
}
