import 'package:flutter/material.dart';

class Kiosk_Button extends StatelessWidget {
  Kiosk_Button(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.maxiSize,
      required this.miniSize,
      required this.textScale,
      required this.textStyle,
      required this.buttonColor,})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final Size maxiSize;
  final Size miniSize;
  final double textScale;
  final dynamic textStyle;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), elevation: 3,
            backgroundColor: buttonColor,
            maximumSize: maxiSize,
            minimumSize: maxiSize,
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
                textScaleFactor: textScale,
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}