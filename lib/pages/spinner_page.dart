// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';

class SpinnerPage extends StatefulWidget {
  const SpinnerPage({super.key});

  @override
  State<SpinnerPage> createState() => _SpinnerPageState();
}

class _SpinnerPageState extends State<SpinnerPage> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    // TODO: implement dispose
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    String reward = "";

    List<String> items = [
      '50 Coins',
      'Movie Ticket',
      'Zomato Coupan',
      'Amazon Coupan',
      'Lenskart Coupan'
    ];

    return Scaffold(
      body: Container(
        width: screenWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFF190a51),
              Color(0xFF6b1cd3),
            ])),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                  )),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected.add(Fortune.randomInt(0, items.length));
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 130,
                    ),
                    Container(
                        width: 400,
                        height: 400,
                        child: FortuneWheel(
                          animateFirst: false,
                          onAnimationEnd: () {
                            selected.stream.first.then((value) {
                              setState(() {
                                reward = items[value];
                                print(reward);
                              });
                            });
                          },
                          items: [
                            for (int i = 0;
                                i < items.length;
                                i++) ...<FortuneItem>{
                              FortuneItem(child: Text(items[i])),
                            }
                          ],
                          selected: selected.stream,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
