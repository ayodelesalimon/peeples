import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditContact extends StatefulWidget {
  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.close),
        actions: [Icon(Icons.check)],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  TextFormField(
                    // controller: nameController,
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
                        hintStyle: GoogleFonts.poppins(fontSize: 12.0)),
                  ),
                  TextFormField(
                    // controller: nameController,
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
                    // controller: nameController,
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
                    // controller: nameController,
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
                // controller: nameController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Phone',
                  hintStyle: GoogleFonts.poppins(fontSize: 12.0) ,
                  prefixIcon: Container(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 8, right: 16),
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
                // controller: nameController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: GoogleFonts.poppins(fontSize: 12.0) ,
                  prefixIcon: Container(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 8, right: 24),
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
                  hintText: 'Gender',
                  hintStyle: GoogleFonts.poppins(fontSize: 12.0) ,
                  prefixIcon: Container(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 8, right: 24),
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
}
