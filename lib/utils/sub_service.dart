// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubService extends StatelessWidget {
  const SubService({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Whatsybot"),
                content: Text("This alert box is for whatsybot service"),
              ),
            );
          },
          child: Text(
            'Whatsybot',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 3,
        )
      ],
    );
  }
}
