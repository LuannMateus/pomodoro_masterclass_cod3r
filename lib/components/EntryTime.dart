import 'package:flutter/material.dart';

class EntryTime extends StatelessWidget {
  final String title;
  final int value;
  final void Function()? increase;
  final void Function()? decrease;

  const EntryTime({
    Key? key,
    required this.title,
    required this.value,
    this.increase,
    this.decrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            this.title,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: this.decrease,
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: const EdgeInsets.all(15),
                  primary: Colors.red,
                ),
              ),
              Text(
                '${this.value} min',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              ElevatedButton(
                onPressed: this.increase,
                child: Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: const EdgeInsets.all(15),
                  primary: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
