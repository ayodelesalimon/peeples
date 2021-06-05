import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:peeples/db/database_helper.dart';
import 'package:peeples/model/contact_model.dart';
import 'package:peeples/screen/contact_detail.dart';

import 'edit.dart';

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

  var dropping = [
    'All contacts',
    'Family',
    'Friends',
  ];

  bool isThemeBGColor = false;

  @override
  Widget build(BuildContext context) {
    var dropHolder = dropping[0];
    return WillPopScope(
      onWillPop: () {
        return moveToLastScreen();
      },
      child: Scaffold(
          backgroundColor: isThemeBGColor ? Colors.black : Colors.white,
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditContact())),
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
                  })
            ],
          ),
          body: FutureBuilder<List<Contact>>(
            future: _helper.getContactList(),
            builder: (context, snapshot) {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyContactDetail()));
                        print('Getting all db list in get func ${snapshot.data[index].firstName}');
                      },
                      child: ListTile(
                        leading: ClipRect(
                          child: Image.asset(list[index].image),
                        ),
                        title: Text(
                          list[index].firstName,
                          style: TextStyle(
                              color: isThemeBGColor ? Colors.white : Colors.black),
                        ),
                        subtitle: Text(
                          list[index].mobile,
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
                  itemCount: list.length);
            }
          )),
    );
  }

  moveToLastScreen() {
    return Navigator.pop(context, true);
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
