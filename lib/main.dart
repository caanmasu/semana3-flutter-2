import 'package:flutter/material.dart';
import 'package:semana3noticias/pages/home.page.dart';

void main(){
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplicación de noticias",
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}