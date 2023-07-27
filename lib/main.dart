
import 'package:aitl_tril_task/pages/home_page.dart';
import 'package:aitl_tril_task/utils/locator.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AITL Trial Task',
      theme: ThemeData(
          primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}





