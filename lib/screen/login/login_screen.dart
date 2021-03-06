import 'package:animation2/screen/home/home_screen.dart';
import 'package:animation2/widget/atagger_animation.dart';
import 'package:animation2/widget/signupbutton.dart';
import 'package:animation2/widget/widget_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;


  @override
  void initState() {
  super.initState();
  _animationController= AnimationController(
    vsync: this,
    duration: Duration(seconds: 2)
  );

  _animationController.addStatusListener((status) {
    if(status==AnimationStatus.completed){
      Navigator.of(context).push(MaterialPageRoute(builder:(context)=>HomeScreen()));
    }
  });
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation=5;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.cover)
        ),
         child: ListView(
           padding: EdgeInsets.zero,
           children:<Widget> [
             Stack(
               alignment: Alignment.bottomCenter,
         children:<Widget>[
             Column(
               children:<Widget>[
                 Padding(
                   padding: EdgeInsets.only(top: 70, bottom: 32),
                   child: Image.asset("images/tickicon.png" , width: 150, height: 150,
                   fit: BoxFit.contain,
                   ),

                 ),
                 FormContainer(),
                 SignUpButton()
               ],
             ),
             StaggerAnimation(
               controller:_animationController.view
             )
           ],
    ),
      ],

    ),
    ),
    );
  }
}
