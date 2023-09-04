import 'package:facebook_interface/screens/principal.dart';
import 'package:facebook_interface/util/paleta_cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Facebook",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(scaffoldBackgroundColor: PaletaCores.scaffold),
    home: Principal(),
  ));
}
