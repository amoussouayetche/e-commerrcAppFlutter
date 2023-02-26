import 'package:chatchap/pages/client/popular_client_detail.dart';
import 'package:chatchap/pages/client/recomanded_client_detail.dart';
import 'package:flutter/material.dart';

import 'pages/home/main_client_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecomandedClientDetail(),
    );
  }
}
