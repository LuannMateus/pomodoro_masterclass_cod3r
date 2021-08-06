import 'package:flutter/material.dart';

class StopwatchButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? handleClick;

  const StopwatchButton({
    Key? key,
    required this.text,
    required this.icon,
    this.handleClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          textStyle: TextStyle(
            fontSize: 25,
          )),
      onPressed: handleClick,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              size: 35,
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
}
