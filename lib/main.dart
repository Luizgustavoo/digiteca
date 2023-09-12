import 'package:digiteca/models/book.dart';
import 'package:digiteca/screens/home_page.dart';
import 'package:digiteca/widgets/book/book_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Digiteca',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ))),
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
          iconColor: MaterialStateProperty.all(Colors.white),
        )),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
            brightness: Brightness.light,
            primary: Colors.black),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}

generateRoute(RouteSettings settings) {
  final path = settings.name!.split('/');
  final title = path[1];

  Book book = books.firstWhere((it) => it.title == title);
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => Detail(book),
  );
}
