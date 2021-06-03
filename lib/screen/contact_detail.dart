import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyContactDetail extends StatefulWidget {
  @override
  _MyContactDetailState createState() => _MyContactDetailState();
}

class _MyContactDetailState extends State<MyContactDetail> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ListTileSwitch(
                  value: _value,
                  leading: Icon(Icons.arrow_back),
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  visualDensity: VisualDensity.comfortable,
                  switchType: SwitchType.cupertino,
                  switchActiveColor: Colors.indigo,
                  title: Text(''),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 36.0,
                            backgroundImage:
                                NetworkImage('https://cutt.ly/gnkXkbj'),
                          ),
                          SizedBox(height: 16.0),
                          Text('Ayodele Salimon',
                              style: GoogleFonts.poppins(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  letterSpacing: 1)),
                          Text(
                            'Flutter Developer @ SBSC',
                            style: GoogleFonts.poppins(
                                fontSize: 14, letterSpacing: 1),
                          ),
                          SizedBox(height: 8),
                          Divider(color: Color(0xff757575)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '080 353 53535',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20, letterSpacing: 1),
                                  ),
                                  Text(
                                    'ayodelesalimon@gmail.com',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14, letterSpacing: 1),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(0xff0AD21E),
                                    child:
                                        Icon(Icons.phone, color: Colors.white),
                                  ),
                                  SizedBox(width: 16),
                                  CircleAvatar(
                                    backgroundColor: Color(0xff2295FF),
                                    child: Icon(
                                      Icons.message,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Whatsapp',
                                style: GoogleFonts.poppins(
                                    fontSize: 20, letterSpacing: 1),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4),
                                width: 36,
                                height: 36,
                                color: Color(0xff28FFA5),
                                child: FaIcon(FontAwesomeIcons.whatsapp),
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(color: Color(0xff757575)),
                        ],
                      ),
                      //end of contact details
                    ],
                  ),
                ),
              ],
            ),
            //the edit and delete icon starts here
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(FontAwesomeIcons.edit),
                      ),
                      Text(
                        'Edit contact',
                        style: GoogleFonts.poppins(fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(FontAwesomeIcons.trashAlt),
                      ),
                      Text(
                        'Delete contact',
                        style: GoogleFonts.poppins(fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
