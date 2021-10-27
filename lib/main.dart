import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shoppify/routes.dart';
import 'package:shoppify/screens/splash/splashscreen.dart';
import 'package:shoppify/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: buildThemeData(),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SplashScreen();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashScreen());
  }
}
