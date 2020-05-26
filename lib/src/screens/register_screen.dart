import 'package:corona_app/src/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register-screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isObscurText = true;
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
                  'assets/icons/corona.png',
                  width: 120,
                ),
                SizedBox(
                  height: 30,
                ),
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
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Caring for the future',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF707070),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: .75,
                  width: screenWith,
                  margin: EdgeInsets.only(bottom: 6),
                  color: Color(0xFF707070),
                ),
                SizedBox(
                  height: 10,
                ),
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
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: isObscurText,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(OMIcons.lock),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscurText = !isObscurText;
                              });
                            },
                            child: isObscurText
                                ? Icon(OMIcons.removeRedEye)
                                : Icon(LineIcons.eye_slash),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: isObscurText,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          prefixIcon: Icon(OMIcons.lock),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscurText = !isObscurText;
                              });
                            },
                            child: isObscurText
                                ? Icon(OMIcons.removeRedEye)
                                : Icon(LineIcons.eye_slash),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: double.infinity,
                        height: 55,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                MenuScreen.routeName, (route) => false);
                          },
                          elevation: 0.75,
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
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
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            child: Text(
                              'Login',
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
