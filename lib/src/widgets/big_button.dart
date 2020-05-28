import 'package:flutter/material.dart';


class BigButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const BigButton({
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      child: RaisedButton(
        onPressed: onPressed,
        elevation: 0.75,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}