import 'package:flutter/material.dart';
import 'package:mobx_card_list/controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<Controller>(
            create: (_) => Controller(),
            dispose: (_, controller) => controller.dispose(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}
