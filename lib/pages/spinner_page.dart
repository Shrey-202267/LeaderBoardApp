// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class SpinnerPage extends StatefulWidget {
  const SpinnerPage({super.key});

  @override
  State<SpinnerPage> createState() => _SpinnerPageState();
}

class _SpinnerPageState extends State<SpinnerPage>
    with SingleTickerProviderStateMixin {
  List<double> sectors = [100, 20, 0.15, 0.05, 50, 20, 100, 50, 20, 50];
  int randomSectorIndex = -1;
  List<double> sectorRadians = [];
  double angle = 0;

  // other data
  bool spinning = false;
  double earnedValue = 0;
  double totalEarnings = 0;
  int spins = 0;

  // random objects to help generate any random int

  math.Random random = math.Random();

  // spin animation contoller
  late AnimationController controller;
  // spin animation
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    // generate sector radians /fill the list
    generateSectorRadians();

    // animation controller
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3600),
    );
    // animation
    Tween<double> tween = Tween<double>(begin: 0, end: 1);

    CurvedAnimation curve = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    animation = tween.animate(curve);
    // ..addListener(() {
    //   setState(() {});
    // });

    // start animation
    controller.addListener(() {
      if (controller.isCompleted) {
        setState(() {
          recordStats();

          spinning = false;
        });
      }
    });
  }

  // dispose contorller after use
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  // build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: _body(),
    );
  }

  // body
  Widget _body() {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 24, 7, 87),
            Color.fromARGB(255, 77, 4, 122),
          ],
        ),
      ),
      child: _spinContent(),
    );
  }

  Widget _spinContent() {
    // use stack

    return Stack(
      children: [
        _spinTitle(),
        _spinWheel(),
        _spinActions(),
        _spinStats(),
      ],
    );
  }

  Widget _spinWheel() {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 5),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.contain, image: AssetImage("lib/Images/belt.png")),
        ),

        // use animated builder for spinning
        child: InkWell(
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.rotate(
                angle: controller.value * angle,
                // use transform.rotate to spin the wheel
                child: Container(
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.07),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("lib/Images/wheel.png"))),
                ),
              );
            },
          ),
          onTap: () {
            // if not Spinning, spin
            setState(() {
              if (!spinning) {
                spin();
                spinning = true;
              } else {
                // if Spinning, stop spinning
                controller.stop();
                spinning = false;
              }
            });
          },
        ),
      ),
    );
  }

  Widget _spinTitle() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 70),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: CupertinoColors.systemYellow,
            width: 2,
          ),
          gradient: const LinearGradient(
            colors: [
              Color(0XFF2d014c),
              Color(0XFFf8009e),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: const Text(
          "Spinning Wheel",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.systemYellow,
          ),
        ),
      ),
    );
  }

  void generateSectorRadians() {
    double sectorRadian = 2 * math.pi / sectors.length;
    for (int i = 0; i < sectors.length; i++) {
      sectorRadians.add(sectorRadian * (i + 1));
    }
  }

  void recordStats() {
    earnedValue = sectors[sectors.length - (randomSectorIndex + 1)];
    totalEarnings = totalEarnings + earnedValue;
    spins = spins + 1;
  }

  void spin() {
    // /spinning here
    randomSectorIndex = random.nextInt(sectors.length);
    double randomRadian = generatedRandomRadianToSpinTo();
    controller.reset();
    angle = randomRadian;
    controller.forward();
  }

  double generatedRandomRadianToSpinTo() {
    return (2 * math.pi * sectors.length) + sectorRadians[randomSectorIndex];
  }

  Widget _spinStats() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: CupertinoColors.systemYellow,
            width: 2,
          ),
          gradient: const LinearGradient(
            colors: [Color(0XFF2d014c), Color(0XFFf8009e)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Table(
          border: TableBorder.all(color: CupertinoColors.systemYellow),
          children: [
            TableRow(children: [
              _titleColumn("Earned"),
              _titleColumn("Earnings"),
              _titleColumn("Spins"),
            ]),
            TableRow(children: [
              _valueColumn(earnedValue),
              _valueColumn(totalEarnings),
              _valueColumn(spins),
            ]),
          ],
        ),
      ),
    );
  }

  Column _titleColumn(String title) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.yellowAccent,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }

  Column _valueColumn(var val) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            '$val',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        )
      ],
    );
  }

  Widget _spinActions() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.17,
            left: 20,
            right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // reset
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: Border.all(color: CupertinoColors.systemYellow),
                  gradient: const LinearGradient(
                    colors: [Color(0XFF2d014c), Color(0XFFf8009e)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 252, 249, 255),
                  ),
                ),
              ),
              onTap: () {
                if (spinning) return;
                setState(() {
                  resetSpin();
                });
              },
            ),

            // on Spin
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: Border.all(color: CupertinoColors.systemYellow),
                  gradient: const LinearGradient(
                    colors: [Color(0XFF2d014c), Color(0XFFf8009e)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: Text(
                  spinning ? "Spinning" : "Spin",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              onTap: () {
                // if not spinning , Spin
                setState(() {
                  if (!spinning) {
                    spin();
                    spinning = true;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void resetSpin() {
    spinning = false;
    angle = 0;
    earnedValue = 0;
    totalEarnings = 0;
    spins = 0;
    controller.reset();
  }
}
