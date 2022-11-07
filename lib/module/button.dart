import 'package:flutter/material.dart';
import 'package:vision21tech_smartkiosk/constants.dart';
// import 'package:vision21tech_smartkiosk/theme.dart';

class Kiosk_Button extends StatelessWidget {
  Kiosk_Button(
      {Key? key,
      required this.text,
      required this.onPressed,})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), elevation: 0,
            backgroundColor: kOrangeButtonColor,
            maximumSize: Size(500, 160),
            minimumSize: Size(500, 160),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(text,
                textAlign: TextAlign.center,
                textScaleFactor: 5,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}