import 'package:flutter/material.dart';
import 'package:piton/Screens/Login/login_screen.dart';
import 'package:piton/Screens/Login/task.dart';
import 'package:piton/Screens/Signup/components/background.dart';
import 'package:piton/Screens/Signup/components/or_divider.dart';
import 'package:piton/Screens/Signup/components/social_icon.dart';
import 'package:piton/components/already_have_an_account_acheck.dart';
import 'package:piton/components/rounded_button.dart';
import 'package:piton/components/rounded_input_field.dart';
import 'package:piton/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Body extends StatelessWidget {

  FirebaseAuth _firebaseAuth;
  String email, password;

  RoundedInputField _roundedInputField;
  RoundedPasswordField _roundedPasswordField;




  Future<FirebaseUser> registuser(BuildContext context) async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: email, password: password)
        .then((result) {
      print(result.user.email);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => task()),
      );


    }



    );





  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "GİRİŞ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Email",

                onChanged: (value) =>email=value,



            ),
            RoundedPasswordField(

                onChanged: (value)=>password=value,



            ),
            RoundedButton(
              text: "Kayıt ol",
              press: () {

                registuser(context);

              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),


          ],
        ),
      ),
    );
  }
}
