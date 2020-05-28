import 'package:corona_app/src/widgets/big_button.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import 'package:corona_app/src/screens/register_screen.dart';
import 'package:corona_app/src/widgets/spacer/spacer.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
        child: Container(
          height: screenHeight,
          width: screenWith,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/icons/icon.png',
                  width: 120,
                ),
                SpaceH30(),
                RichText(
                  text: TextSpan(
                    text: 'Corona ',
                    style: TextStyle(
                      color: Color(0xFF7777FF),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'Virus',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SpaceH20(),
                Text(
                  'Caring for the future',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF707070),
                  ),
                ),
                SpaceH80(),
                Container(
                  height: .75,
                  width: screenWith,
                  margin: EdgeInsets.only(bottom: 6),
                  color: Color(0xFF707070),
                ),
                SpaceH10(),
                Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Enter Mobile No.',
                          prefixIcon: Icon(OMIcons.smartphone),
                        ),
                      ),
                      SpaceH20(),
                      TextFormField(
                        obscureText: isObscureText,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(OMIcons.lock),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: isObscureText
                                ? Icon(OMIcons.removeRedEye)
                                : Icon(LineIcons.eye_slash),
                          ),
                        ),
                      ),
                      SpaceH40(),
                      BigButton(
                        text: 'LOGIN',
                        onPressed: () {},
                      ),
                      SpaceH40(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Don\'t have an account ?',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegisterScreen.routeName);
                            },
                            padding: EdgeInsets.zero,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF7777FF),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

