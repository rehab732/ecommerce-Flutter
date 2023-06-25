import 'package:ecommerce/provider/adminmode.dart';
import 'package:ecommerce/provider/modelhud.dart';
import 'package:ecommerce/screens/adminhome.dart';
import 'package:ecommerce/screens/homepage.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoadingCircle>
        (create: (context)=>LoadingCircle()
        ),
          ChangeNotifierProvider<AdminMode>
        (create: (context)=>AdminMode()
        ),

      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Login.id,
          routes: {
            Login.id: ((context) => Login()),
            SignUp.id: ((context) => SignUp()),
            HomePage.id:(((context) => HomePage())),
            AdminHome.id:((context) => const AdminHome()),
          },
        
      ),
    );
  }
}
