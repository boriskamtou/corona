import 'package:corona_app/src/widgets/big_button.dart';
import 'package:corona_app/src/widgets/spacer/spacer.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import 'package:corona_app/src/constants/colors.dart';
import 'menu_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register-screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;
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
                      color: kIndigo,
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
                SpaceH40(),
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
                        obscureText: isObscurePassword,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(OMIcons.lock),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscurePassword = !isObscurePassword;
                              });
                            },
                            child: isObscurePassword
                                ? Icon(OMIcons.removeRedEye)
                                : Icon(LineIcons.eye_slash),
                          ),
                        ),
                      ),
                      SpaceH20(),
                      TextFormField(
                        obscureText: isObscureConfirmPassword,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          prefixIcon: Icon(OMIcons.lock),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscurePassword = !isObscurePassword;
                              });
                            },
                            child: isObscurePassword
                                ? Icon(OMIcons.removeRedEye)
                                : Icon(LineIcons.eye_slash),
                          ),
                        ),
                      ),
                      SpaceH40(),
                      BigButton(
                        text: 'REGISTER',
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, MenuScreen.routeName, (route) => false);
                        },
                      ),
                      SpaceH30(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Already have an account ?',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  LoginScreen.routeName, (route) => false);
                            },
                            padding: EdgeInsets.zero,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: kIndigo,
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
