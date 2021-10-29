import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppify/model/user_model.dart';
import 'package:shoppify/network/authentication_service.dart';
import 'package:shoppify/routes.dart';
import 'package:shoppify/screens/create_account_screen/register_account_screen.dart';
import 'package:shoppify/screens/home_connected/home_connected.dart';
import 'package:shoppify/screens/profile/profile_screen.dart';
import 'package:shoppify/screens/sign_in/sign_in_screen.dart';
import 'package:shoppify/screens/splash/splashscreen.dart';
import 'package:shoppify/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
        value: AuthenticationService().user,
        initialData: null,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: buildThemeData(),
          initialRoute: '/',
          onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
          routes: routes,
        ));
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case SignInScreen.routeName:
        return MaterialPageRoute(builder: (context) => SignInScreen());
      case HomeConnected.routeName:
        return MaterialPageRoute(builder: (context) => HomeConnected());
      case CreateAccountScreen.routeName:
        return MaterialPageRoute(builder: (context) => CreateAccountScreen());
      case ProfileScreen.routeName:
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      default:
        return pageNotFound();
    }
  }

  static MaterialPageRoute pageNotFound() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
            appBar: AppBar(title: Text("Error"), centerTitle: true),
            body: Center(
              child: Text("Page not found"),
            )));
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
