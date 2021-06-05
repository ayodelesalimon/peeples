import 'package:my_app/screens/contact_detail.dart';
import 'package:my_app/screens/edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/model/contact_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var dropping = [
    'All contacts',
    'Family',
    'Friends',
  ];
  String selected = 'All contacts';
  String switchText = 'Dark';
  bool isThemeBGColor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isThemeBGColor ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(right: 130),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              value: selected,
              items: dropping
                  .map((e) => DropdownMenuItem<String>(
                value: e,
                child: Text(
                  e,
                  style: TextStyle(
                    color:
                    isThemeBGColor ? Colors.white : Colors.black,
                  ),
                ),
              ))
                  .toList(),
              onChanged: (String value) {
                setState(() {
                  selected = value;
                });
              },
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              switchText,
              style: TextStyle(
                  color: isThemeBGColor ? Colors.white : Colors.black),
            ),
          ),
          Switch(
              value: isThemeBGColor,
              onChanged: (val) {
                setState(() {
                  isThemeBGColor = val;
                  switchText = 'Light';
                });
              })
        ],
      ),
      body: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){return EditContact();}));
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
            ));
          },
          separatorBuilder: (context, index) => Divider(
            color: isThemeBGColor ? Colors.grey : Colors.grey,
          ),
          itemCount: list.length),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){return EditContact();}));
      }, child: Icon(Icons.add),),);
  }
}

var list = [
  Contact(
      image: 'assets/images/avatarPic.png',
      firstName: 'Ayodele',
      mobile: '09087875784'),
  Contact(
      image: 'assets/images/avatarPic.png',
      firstName: 'David',
      mobile: '09087875784'),
  Contact(
      image: 'assets/images/avatarPic.png',
      firstName: 'Fortune',
      mobile: '09087875784'),
  Contact(
      image: 'assets/images/avatarPic.png',
      firstName: 'Fortune',
      mobile: '09087875784'),
  Contact(
      image: 'assets/images/avatarPic.png',
      firstName: 'Fortune',
      mobile: '09087875784'),
];
