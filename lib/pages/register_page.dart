import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Units/general_button.dart';
import '../Units/text_field.dart';
import '../tools/snackbar_method.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String id = "RegisterPage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isValidForm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D47A1),
      body: ModalProgressHUD(
        inAsyncCall:isValidForm,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Image.asset('assets/school.png',height: 350,),
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
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GeneralTextField(
                hintText: 'User Name',
                boarderColor: Colors.white,
                textColor: Colors.white,
                onChange: (data) {
                  email = data;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              GeneralTextField(
                hintText: 'passowrd',
                boarderColor: Colors.white,
                textColor: Colors.white,
                onChange: (data) {
                  password = data;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ClickButton(
                labe: 'Register',
                buttonColor: Colors.white,
                height: 60,
                onChange: () async {
                  if (formKey.currentState!.validate()) {
                    isValidForm = true;
                    setState(() {

                    });
                    try {
                      await registerUser();
                      isValidForm = false;
                      setState(() {

                      });
                      snackBarMessage(context,'you have registered successfully');
                      Navigator.pop(context);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        isValidForm = false;
                        setState(() {

                        });
                        snackBarMessage(context,'weak-password ');
                      } else if (e.code == 'email-already-in-use') {
                        isValidForm = false;
                        setState(() {

                        });
                        snackBarMessage(context,' email-already-in-use ');
                      }
                    } catch (e) {
                      isValidForm = false;
                      setState(() {

                      });
                      snackBarMessage(context,'unable to register');
                    }
                    isValidForm = false;
                    setState(() {

                    });
                  }else
                    {
                      snackBarMessage(context,'please fill all fields');
                    }
        
                },
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text("already you have an account  Login ",
                      style: TextStyle(color: Colors.white, fontSize: 15)))
            ],
          ),
        ),
      ),
    );
  }


  Future<void> registerUser() async {
    UserCredential auth = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: email!, password: password!);
  }

}
