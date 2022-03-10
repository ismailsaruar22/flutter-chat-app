import 'package:chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  static String id = 'welcome_screen';
  late AnimationController controller;
  late Animation animation;
  late Animation colorAnimation;
  late Animation bgColorAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    colorAnimation =
        ColorTween(begin: Colors.red.shade900, end: Colors.green.shade900)
            .animate(controller);
    bgColorAnimation =
        ColorTween(begin: Colors.blueGrey, end: Colors.teal.shade100)
            .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorAnimation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  transitionOnUserGestures: true,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.shade700,
                      border: Border.all(
                        width: 8.0,
                        style: BorderStyle.solid,
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Image.asset('images/logo.png'),
                    alignment: Alignment.center,
                    height: animation.value * 80,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Ajaira Chat',
                  style: TextStyle(
                    fontSize: 35.0,
                    color: colorAnimation.value,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            CustomButton(
              color: Colors.lightBlueAccent,
              title: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, 'LoginScreen.id');
              },
            ),
            CustomButton(
              color: Colors.green.shade500,
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, 'RegistrationScreen.id');
              },
            ),
          ],
        ),
      ),
    );
  }
}
