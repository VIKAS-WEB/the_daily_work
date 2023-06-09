import 'package:flutter/material.dart';
import 'package:the_daily_work/Login.dart';
import 'package:the_daily_work/Register.dart';
import 'package:ionicons/ionicons.dart';

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationController2;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 50),
      vsync: this,
      lowerBound: 0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });

    _animationController2 = AnimationController(
      duration: const  Duration(milliseconds: 50),
      vsync: this,
      lowerBound: 0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double scale1 = 1 + _animationController.value;
    double scale2 = 1 + _animationController2.value;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Color.fromARGB(255, 14, 171, 243),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: h / 4,
            ),
            Image.asset(
              'assets/images/lggg.png',
              fit: BoxFit.cover,
            ),
            // Text(
            //   'Welcome To TheDailyWork',
            //   style: TextStyle(
            //       fontSize: 32,
            //       color: Colors.white,
            //       fontFamily: 'Pacifico',
            //       fontWeight: FontWeight.w600),
            // ),
            SizedBox(
              height: h / 18,
            ),
            Text(
              'Please Select Options',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: h * 0.05),
            GestureDetector(
              onTapUp: onTapUp,
              onTapDown: onTapDown,
              onTapCancel: onTapCancel,
              child: Transform.scale(
                scale: scale1,
                child: Container(
                  alignment: Alignment.center,
                  // decoration: BoxDecoration(
                  //     color: Colors.white12,
                  //     borderRadius: BorderRadius.circular(300)
                  // ),
                  child: SingleChildScrollView(
                    child: Container(
                      alignment: Alignment.center,

                      child: Container(
                        height: MediaQuery.of(context).size.height * 1 / 12,
                        width: MediaQuery.of(context).size.width * 3 / 5,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.white12, Colors.blue]),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(""),
                            const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: const Icon(
                                  Ionicons.log_in,
                                  color: Colors.blue,
                                ))
                          ],
                        ),
                      ),
                      // child: Text(
                      //   'Login',
                      //   style: TextStyle(
                      //       fontSize: 20,
                      //       color: Colors.white,
                      //       fontFamily: 'Muli',
                      //       fontWeight: FontWeight.bold),
                      // ),

                      //   child: Image.asset('assets/images/CCR.png',
                      //       fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: h * 0.03,
            // ),
            // Text(
            //   'or',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //       color: Colors.white,
            //       fontFamily: 'Roboto',
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold),
            // ),
            SizedBox(
              height: h * 0.03,
            ),
            GestureDetector(
              onTapUp: onTapUp2,
              onTapDown: onTapDown2,
              onTapCancel: onTapCancel2,
              child: Transform.scale(
                  scale: scale2,
                  child: Container(
                    alignment: Alignment.center,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1 / 12,
                      width: MediaQuery.of(context).size.width * 3 / 5,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.white12, Colors.blue]),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(""),
                          const Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: const Icon(
                                Ionicons.person_add,
                                color: Colors.blue,
                              ))
                        ],
                      ),
                    ),
                    // height: h / 7,
                    // width: w / 4,
                    //     decoration: BoxDecoration(
                    //     color: Colors.white24,
                    //     borderRadius: BorderRadius.circular(300)
                    // ),
                    // child: Container(
                    //   alignment: Alignment.center,
                    // height: h / 5,
                    // child: Text(
                    //   'Sign Up',
                    //   style: TextStyle(
                    //       fontSize: 20,
                    //       color: Colors.white,
                    //       fontFamily: 'Muli',
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // child: Image.asset(
                    //   'assets/images/shop.png',
                    //   fit: BoxFit.contain,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  onTapUp(TapUpDetails details) {
    _animationController.reverse();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  onTapCancel() {
    _animationController.reverse();
  }

  onTapUp2(TapUpDetails details) {
    _animationController2.reverse();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register()),
    );
  }

  onTapDown2(TapDownDetails details) {
    _animationController2.forward();
  }

  onTapCancel2() {
    _animationController2.reverse();
  }
}
