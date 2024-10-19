import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_fire/pages/chat_page.dart';
import 'package:test_fire/pages/register_page.dart';
import 'package:test_fire/tools/snackbar_method.dart';

import '../Constants.dart';
import '../Units/general_button.dart';
import '../Units/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = "LoginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;
  GlobalKey<FormState> fKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: fKey,
          child: ListView(
            children: [
              Image.asset(
                'assets/school.png',
                height: 250,
              ),
              const Text(
                'Schoolar Chat',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              const Row(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GeneralTextField(
                  onChange: (data) {
                    email = data;
                  },
                  hintText: 'User Name',
                  boarderColor: Colors.white,
                  textColor: Colors.white),
              const SizedBox(
                height: 30,
              ),
              GeneralTextField(
                  onChange: (data) {
                    password = data;
                  },
                  hintText: 'passowrd',
                  boarderColor: Colors.white,
                  textColor: Colors.white),
              const SizedBox(
                height: 30,
              ),
              ClickButton(
                height: 60,
                buttonColor: Colors.white,
                labe: 'Login',
                onChange: () async {
                  if (fKey.currentState!.validate()) {
                    try {
                      UserCredential user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(email: email!, password: password!);
                      snackBarMessage(context, 'Login successful');
                      Navigator.pushNamed(context, ChatPage.id);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        snackBarMessage(context, 'User not found');
                      } else if (e.code == 'wrong-password') {
                        snackBarMessage(context, 'Wrong password');
                      } else {
                        snackBarMessage(context, 'Firebase error: ${e.message}');
                      }
                    } catch (e) {
                       // Debugging the unexpected error
                      snackBarMessage(context, e.toString());
                    }

                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RegisterPage.id);
                },
                child: const Text(
                  'You dont have already an account ?  register',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
