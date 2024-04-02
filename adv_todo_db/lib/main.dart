import 'package:adv_todo_db/database.dart';
import 'package:flutter/material.dart';
import 'todoappui.dart';

//dynamic database;
void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await createDB();
  await initList();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TODOAppUI(),
    );
  }
}
