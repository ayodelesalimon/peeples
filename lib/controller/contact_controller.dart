import 'package:flutter/material.dart';
import 'package:peeples/db/database_helper.dart';
import 'package:peeples/model/contact_model.dart';

class ContactControl with ChangeNotifier{

  bool isThemeBGColor = false;

  setSwitch(val){
    isThemeBGColor = val;
  }

}