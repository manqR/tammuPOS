import 'package:flutter/material.dart';
import 'package:postammu/Components/AppDrawer.dart';

class ShiftPage extends StatelessWidget {
  static const String routeName = '/events';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Shift"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("Shift")));
  }
}