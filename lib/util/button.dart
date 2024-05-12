import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

   MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed,
    //color: Colors.blue,
      child: Text(text,
      style: TextStyle(
        fontSize: 20,
        //fontWeight: FontWeight.w100,
        color: Colors.black,
      ),
      ),
      style: OutlinedButton.styleFrom(
        shape: StadiumBorder(),
        backgroundColor: Colors.blue[400],
        side: BorderSide(
          width: 1,
          color: Colors.blue
        )
      ),
    );
  }
}
