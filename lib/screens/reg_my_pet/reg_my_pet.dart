//Acompanhe desing do projeto aqui --> https://www.figma.com/file/GYFrt79mzIbOUXXmFyDgwL/Material-Baseline-Design-Kit?node-id=38%3A5814

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:petsaojoao/components/foundation_form/splash_screen_foundation.dart';
import 'package:petsaojoao/services/repo_reg_my_pet/api_rest_reg_my_pet.dart';
import 'package:petsaojoao/services/repo_reg_tutor/api_rest_tutor.dart';
import 'my_pet_info_first.dart';

class RegMyPet extends StatefulWidget {
  @override
  _RegMyPetState createState() => _RegMyPetState();
}

class _RegMyPetState extends State<RegMyPet> {
  void navigationToNextPage() {
    Navigator.pushReplacement(context, _createRoute());
  }

  startCadTutorTimer() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startCadTutorTimer();
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueAccent[200],
        body: SplahScreenFoundation("Vamos editar seu Pet"),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MyPetInfoFirst(),
    transitionDuration: const Duration(milliseconds: 1800),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
