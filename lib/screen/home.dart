import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:peeples/db/database_helper.dart';
import 'package:peeples/model/contact_model.dart';
import 'package:peeples/screen/contact_detail.dart';
import 'package:sqflite/sqflite.dart';

import 'add_contact.dart';

class HomeScreen extends StatefulWidget {
  final Contact contact;

  const HomeScreen({Key key, this.contact}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState(this.contact);
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseHelper _helper = DatabaseHelper();
  Contact contact;
  _HomeScreenState(this.contact);

  List<Contact> contactList;
  int count = 0;

  var dropping = [
    'All contacts',
    'Family',
    'Friends',
  ];

  bool isThemeBGColor = false;

  @override
  Widget build(BuildContext context) {
    var dropHolder = dropping[0];

    // if (contactList == null) {
    //   setState(() {
    //     contactList = <Contact>[];
    //     updateListView();
    //   });
    // } else {
    //   setState(() {
    //     updateListView();
    //   });
    // }
    return WillPopScope(
      onWillPop: () {
        return moveToLastScreen();
      },
      child: Scaffold(
          backgroundColor: isThemeBGColor ? Colors.black : Colors.white,
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddContact())),
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.only(right: 130),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,
                  value: dropHolder,
                  items: dropping
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(
                              e,
                              style: TextStyle(
                                color: isThemeBGColor
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      //TODO I tried changing the value but it is not wrking
                      dropHolder = value.toString();
                    });
                  },
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Dark',
                  style: TextStyle(
                      color: isThemeBGColor ? Colors.white : Colors.black),
                ),
              ),
              Switch(
                  value: isThemeBGColor,
                  onChanged: (val) {
                    setState(() {
                      isThemeBGColor = val;
                    });
                  }),
              // ListTileSwitch(
              //   value: isThemeBGColor,
              //   leading: Icon(Icons.arrow_back),
              //   onChanged: (value) {
              //     setState(() {
              //       isThemeBGColor = value;
              //     });
              //   },
              //   visualDensity: VisualDensity.comfortable,
              //   switchType: SwitchType.cupertino,
              //   switchActiveColor: Colors.indigo,
              //   title: Text(''),
              // ),
            ],
          ),
          body: getContactListView()),
    );
  }

  Widget getContactListView() {
    if (contactList == null) {
      setState(() {
        contactList = <Contact>[];
        updateListView();
      });
    } else {
      setState(() {
        updateListView();
      });
    }
    return contactList == null || contactList.isEmpty
        ? Center(
            child: Text(
              'Click on the + button below to add contact!',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var dbData = this.contactList;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MyContactDetail(contactDetails: dbData[index])));
                  print(
                      'Getting all db list in get func ${dbData[index].firstName}');
                },
                child: ListTile(
                  leading: ClipRect(
                    child: Container( padding: EdgeInsets.all(8),child: Image.asset(dbData[index].image, fit: BoxFit.cover,)),
                  ),
                  title: Text(
                    dbData[index].firstName,
                    style: TextStyle(
                        color: isThemeBGColor ? Colors.white : Colors.black),
                  ),
                  subtitle: Text(
                    dbData[index].mobile,
                    style: TextStyle(
                        color: isThemeBGColor ? Colors.grey : Colors.grey),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 12,
                    color: isThemeBGColor ? Colors.grey : Colors.grey,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  color: isThemeBGColor ? Colors.grey : Colors.grey,
                ),
            itemCount: count);
  }

  moveToLastScreen() {
    return Navigator.pop(context, true);
  }

  void updateListView() {
    final Future<Database> dbFuture = _helper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Contact>> contactListFuture = _helper.getContactList();
      contactListFuture.then((contactList) {
        setState(() {
          this.contactList = contactList;
          this.count = contactList.length;
          print('get from the db list $contactList');
        });
      });
    });
  }
}

var list = [
  Contact(
      image: 'assets/images/avatarpic.png',
      firstName: 'Ayodele',
      mobile: '09087875784'),
  Contact(
      image: 'assets/images/avatarpic.png',
      firstName: 'David',
      mobile: '09087875784'),
  Contact(
      image: 'assets/images/avatarpic.png',
      firstName: 'Fortune',
      mobile: '09087875784'),
  Contact(
      image: 'assets/images/avatarpic.png',
      firstName: 'Fortune',
      mobile: '09087875784'),
  Contact(
      image: 'assets/images/avatarpic.png',
      firstName: 'Fortune',
      mobile: '09087875784'),
];
