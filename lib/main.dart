import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(splashColor: Colors.black),
    debugShowCheckedModeBanner: false,
    // initialRoute: '/home',
    routes: {
      '/': (_) => const Loading(),
      '/home': (_) => const Home(),
      '/location': (_) => const ChooseLocation(),
    },
  ));
}
