import 'dart:io';

import 'package:peeples/model/contact_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
  static Database _database;                // Singleton Database

  String contactTable = 'contact_table';
  String colId = 'id';
  String colImage = 'image';
  String colFirstName = 'first_name';
  String colLastName = 'last_name';
  String colCompany = 'company';
  String colTitle = 'title';
  String colMobile = 'mobile';
  String colGender = 'gender';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'contact.db';

    // Open/create the database at a given path
    var contactDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return contactDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $contactTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colImage TEXT, $colTitle TEXT, '
        '$colFirstName TEXT, $colLastName TEXT, $colMobile TEXT, $colGender TEXT, $colCompany TEXT)');
  }

  // Fetch Operation: Get all contact objects from database
  Future<List<Map<String, dynamic>>> getContactMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $contactTable order by $colFirstName ASC');
    var result = await db.query(contactTable, orderBy: '$colFirstName ASC');
    return result;
  }

  // Insert Operation: Insert a contact object to database
  Future<int> insertContact(Contact contact) async {
    Database db = await this.database;
    var result = await db.insert(contactTable, contact.toMap());
    return result;
  }

  // Update Operation: Update a contact object and save it to database
  Future<int> updateContact(Contact contact) async {
    var db = await this.database;
    var result = await db.update(contactTable, contact.toMap(), where: '$colId = ?', whereArgs: [contact.id]);
    return result;
  }

  Future<int> updateContactCompleted(Contact contact) async {
    var db = await this.database;
    var result = await db.update(contactTable, contact.toMap(), where: '$colId = ?', whereArgs: [contact.id]);
    return result;
  }

  // Delete Operation: Delete a contact object from database
  Future<int> deleteContact(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $contactTable WHERE $colId = $id');
    return result;
  }

  // Get number of contact objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $contactTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'contact List' [ List<Contact> ]
  Future<List<Contact>> getContactList() async {

    var contactMapList = await getContactMapList(); // Get 'Map List' from database
    int count = contactMapList.length;         // Count the number of map entries in db table

    List<Contact> contactList = List<Contact>();
    // For loop to create a 'contact List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      contactList.add(Contact.fromMapObject(contactMapList[i]));
    }

    return contactList;
  }

}
