import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EditContact extends StatefulWidget {
  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {


  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  String hintGender = 'Male';
  List<String> items = ['Male', 'female'];
  final _formKey = GlobalKey<FormState>();
  late File _imageFile;
  final picker = ImagePicker();

  _openGallery() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery, maxWidth: 200.0, maxHeight: 200.0 );
    this.setState(() {
      if(pickedFile != null){
        _imageFile = File(pickedFile.path);
      }else{
        print('No image selected');
      }
    });
  }

  _openCamera() async{
    final pickedFile = await picker.getImage(source: ImageSource.camera, maxWidth: 200.0, maxHeight: 200.0 );
    this.setState(() {
      if(pickedFile != null){
        _imageFile = File(pickedFile.path);
      }else{
        print('No image selected');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: Icon(
            Icons.close,
          ),
        ),
        actions: [Icon(Icons.check)],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            //Circle Avatar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 200,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text('Photo',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16
                                      ),),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:1,
                                child: ListTile(
                                  leading: GestureDetector(
                                    onTap: _openCamera,
                                    child: Text('Take photo',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: ListTile(
                                  leading: GestureDetector(
                                  onTap: _openGallery,
                                    child: Text('Choose photo from gallery',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16
                                      ),),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      });
                },
                child: CircleAvatar(
                    radius: 36.0,
                    backgroundColor: Colors.grey,
                    // ignore: unnecessary_null_comparison
                    child: _imageFile == null ? Icon(Icons.add_a_photo) : Image.file(_imageFile)),
              ),
            ),

            //forms name
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 36.0,
                backgroundColor: Colors.grey,
                child: Icon(Icons.verified_user)
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  TextFormField(
                    controller: _firstNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff464646),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff464646)),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8.0),
                                topLeft: Radius.circular(8.0))),
                        hintText: 'First Name',
                        hintStyle: GoogleFonts.poppins(fontSize: 12.0)),
                  ),
                  TextFormField(
                    controller: _lastNameController,
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
                        hintStyle: GoogleFonts.poppins(fontSize: 12.0)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _companyController,
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
                        hintStyle: GoogleFonts.poppins(fontSize: 12.0)),
                  ),
                  TextFormField(
                    controller: _titleController,
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
                        hintStyle: GoogleFonts.poppins(fontSize: 12.0)),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Phone',
                  hintStyle: GoogleFonts.poppins(fontSize: 12.0),
                  prefixIcon: Container(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8, left: 8, right: 16),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: Colors.grey))),
                    child: Text(
                      'Mobile',
                      style: GoogleFonts.poppins(fontSize: 12.0),
                    ),
                  ),
                  filled: true,
                  fillColor: Color(0xff464646),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff464646)),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: GoogleFonts.poppins(fontSize: 12.0),
                  prefixIcon: Container(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8, left: 8, right: 24),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: Colors.grey))),
                    child: Text(
                      'Work',
                      style: GoogleFonts.poppins(fontSize: 12.0),
                    ),
                  ),
                  filled: true,
                  fillColor: Color(0xff464646),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff464646)),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: TextFormField(
                // controller: nameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
<<<<<<< HEAD
                  suffixIcon: PopupMenuButton(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value) {
                      hintGender = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return items.map<PopupMenuItem<String>>((String value) {
=======
                   suffixIcon: PopupMenuButton(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value){

                    },
                    itemBuilder: (BuildContext context){
                      return items.map<PopupMenuItem<String>>((String value){
>>>>>>> 4d915c4f36bd0434fefc8f7a7b9e4f6c1771f515
                        return PopupMenuItem(child: Text(value), value: value);
                      }).toList();
                    },
                  ),
<<<<<<< HEAD
                  hintStyle: GoogleFonts.poppins(fontSize: 12.0),
=======
                  hintText: 'Gender',
                  hintStyle: GoogleFonts.poppins(fontSize: 12.0) ,
>>>>>>> 4d915c4f36bd0434fefc8f7a7b9e4f6c1771f515
                  prefixIcon: Container(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8, left: 8, right: 24),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: Colors.grey))),
                    child: Text(
                      'Male',
                      style: GoogleFonts.poppins(fontSize: 12.0),
                    ),
                  ),
                  filled: true,
                  fillColor: Color(0xff464646),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff464646)),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
   List<String> items = ['Male', 'female'];
}
