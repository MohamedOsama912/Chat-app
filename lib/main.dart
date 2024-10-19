import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_fire/pages/chat_page.dart';
import 'package:test_fire/pages/login_pages.dart';
import 'package:test_fire/pages/register_page.dart';

import 'firebase_options.dart';



void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        routes:
        {
          'LoginPage' : (context) => const LoginPage(),
          RegisterPage.id : (context) => const RegisterPage(),
          ChatPage.id : (context) =>  ChatPage()

        },
        initialRoute:  'LoginPage'
    );
  }
}