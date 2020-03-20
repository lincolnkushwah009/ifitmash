import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:ifitmash/model/weight.dart';

class DatabaseHelper {

	static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
	static Database _database;                // Singleton Database

	String weightTable = 'weight_table';
	String colId = 'id';
	// String colTitle = 'title';
	// String colDescription = 'description';
	String colWeight = 'weight';

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
		String path = directory.path + 'weight.db';

		// Open/create the database at a given path
		var todosDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
		return todosDatabase;
	}

	void _createDb(Database db, int newVersion) async {

		await db.execute('CREATE TABLE $weightTable($colId INTEGER PRIMARY KEY AUTOINCREMENT');
	}

	// Fetch Operation: Get all todo objects from database
	Future<List<Map<String, dynamic>>> getWeightMapList() async {
		Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $todoTable order by $colTitle ASC');
		var result = await db.query(weightTable, orderBy: '$colWeight ASC');
		return result;
	}

	// Insert Operation: Insert a todo object to database
	Future<int> insertTodo(Weight weight) async {
		Database db = await this.database;
		var result = await db.insert(weightTable, weight.toMap());
		return result;
	}

	// Update Operation: Update a todo object and save it to database
	Future<int> updateTodo(Weight weight) async {
		var db = await this.database;
		var result = await db.update(weightTable, weight.toMap(), where: '$colId = ?', whereArgs: [weight.id]);
		return result;
	}

  	Future<int> updateTodoCompleted(Weight weight) async {
		var db = await this.database;
		var result = await db.update(weightTable, weight.toMap(), where: '$colId = ?', whereArgs: [weight.id]);
		return result;
	}

	// Delete Operation: Delete a todo object from database
	Future<int> deleteTodo(int id) async {
		var db = await this.database;
		int result = await db.rawDelete('DELETE FROM $weightTable WHERE $colId = $id');
		return result;
	}

	// Get number of todo objects in database
	Future<int> getCount() async {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $weightTable');
		int result = Sqflite.firstIntValue(x);
		return result;
	}

	// Get the 'Map List' [ List<Map> ] and convert it to 'todo List' [ List<Todo> ]
	Future<List<Weight>> getWeightList() async {

		var weightMapList = await getWeightMapList(); // Get 'Map List' from database
		int count = weightMapList.length;         // Count the number of map entries in db table

		List<Weight> weightList = List<Weight>();
		// For loop to create a 'todo List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			weightList.add(Weight.fromMapObject(weightMapList[i]));
		}

		return weightList;
	}

}







