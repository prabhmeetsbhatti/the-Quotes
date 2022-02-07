import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_sides_app/Utils/news_provider.dart';
import 'package:two_sides_app/widgets/home.dart';

void main() {
  runApp(ChangeNotifierProvider<NewsProvider>(
      child: MaterialApp(
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xff14213d)),
          ),
          darkTheme: ThemeData.dark()),
      create: (context) => NewsProvider()));
}
