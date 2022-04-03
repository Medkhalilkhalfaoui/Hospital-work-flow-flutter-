import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hopital/cin-enter.dart';
import 'package:hopital/personne.dart';
import 'package:hopital/view.dart';
import 'pageaceuil.dart';
import 'package:splashscreen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      //home: MyHomePage(),
      routes: {
        '/': (context) => MyHomePage(),
        '/2': (context) => Cin(),
        '/3': (context) => View(),
        '/4': (context) => Personne(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: Aceuil(),
        //title:  Text('welcome', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blue),),
        image:  Image.asset('assets/splash.png'),
        backgroundColor: Color.fromRGBO(239, 250,255, 1),
        //styleTextUnderTheLoader: new TextStyle(color: Colors.amber),
        photoSize: 140.0,
        loaderColor: Color.fromRGBO(47, 206,214, 1),
    );
  }
}




