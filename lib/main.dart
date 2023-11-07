import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'registration/form.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const  FirebaseOptions(
        apiKey: "AIzaSyB1oIaGO2wptE06lsR1NWsKHB5XvPQihDk",
        authDomain: "testing-project-fe112.firebaseapp.com",
        projectId: "testing-project-fe112",
        storageBucket: "testing-project-fe112.appspot.com",
        messagingSenderId: "512778607189",
        appId: "1:512778607189:web:203ad0b718a659170112dc"
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
          primarySwatch: Colors.green
      ),
      home: MyHomepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  State<MyHomepage> createState() => _MyHomepageState();
}
class _MyHomepageState extends State<MyHomepage> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds:7),
            () =>Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context)=>Registration())));
  }
  @override
  Widget build(BuildContext context) {
    final s =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Color.fromRGBO(35, 10, 37, 1.0),

      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
            height: s.height,
            width: s.width,
            child: Column(
              children: [
                Lottie.asset(
                  'assets/Animation - 1699301364665.json',
                  width: 200,
                  height:200,
                  repeat: true,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child:Container(
                      color: Colors.transparent, // Set the container background color to transparent
                      child: TextLiquidFill(
                        text: 'REGISTRATION FORM',
                        loadDuration: Duration(seconds: 4),
                        waveColor: Color.fromRGBO(203, 161, 84, 1.0),
                        boxBackgroundColor: Colors.white,
                        boxWidth: 410,
                        textStyle: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                          // color: Colors.black, // Set text color to black
                        ),
                        boxHeight: 100.0,
                      ),
                    ),
                    )
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}