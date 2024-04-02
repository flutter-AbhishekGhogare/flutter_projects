import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'todomodel.dart';

dynamic database;
List<Map<String, dynamic>> taskList = [];

Future createDB() async {
  database = openDatabase(
    join(await getDatabasesPath(),"todoDatabase"),
    version: 1,
    onCreate: (db, version) {
      db.execute('''
      CREATE TABLE ToDoTable(
        id INT PRIMARY KEY,
        task TEXT ,
        explanation TEXT,
        date TEXT,
        status TEXT
      )
      ''');
    },
  );
  
  print(database);
  return database;
}

Future<void> initList() async {
taskList = await getToDoTaskFromDatabase();
print("In printdb");
print(database);
}

Future<void> insertTask(Task taskobj) async {
  final localDB = await database;
  localDB.insert(
    'ToDoTable',
    taskobj.toDoTask(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> deleteTaskInDatabase(int index) async {
  final localDB = await database;
  await localDB.delete(
    'ToDoTable',
    where: "id = ?",
    whereArgs: [index],
  );
}

Future<void> updateTaskInDatabase(Task taskobj) async {
  final localDB = await database;
  Map newCard = await taskobj.toDoTask();
  await localDB.update(
    'ToDoTable',
    newCard,
    where: "id = ?",
    whereArgs: [taskobj.id],
  );
}

Future<List<Map<String,dynamic>>> getToDoTaskFromDatabase() async {
  final localDB = await database;
  List<Map<String,dynamic>> toDoList = await localDB.query("ToDoTable");
  return toDoList;
}
