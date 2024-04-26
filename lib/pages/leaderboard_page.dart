import 'package:flutter/material.dart';
import 'package:leaderboard/utils/leaderboard%20data/leaderboard_heading.dart';
import 'package:leaderboard/utils/leaderboard%20data/top-three.dart';

class LeaderBoardPage extends StatelessWidget {
  const LeaderBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: screenWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 25, 3, 105),
              Color.fromARGB(255, 59, 18, 116),
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: OverflowBox(
            maxHeight: MediaQuery.of(context).size.height -
                50, // Set the maximum height
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    width: 335,
                    height: 240,
                    child: PageView(
                      children: const [
                        TopThree(
                          fname1: '2. Lokesh',
                          lname1: 'Burade',
                          imagepath1: 'lib/Images/person2.png',
                          fname2: '1. Lalit',
                          lname2: 'kondekar',
                          imagepath2: 'lib/Images/person1.png',
                          fname3: '3. Shreyash',
                          lname3: 'Jawalkar',
                          imagepath3: 'lib/Images/person3.png',
                        ),
                      ],
                    ),
                  ),
                ),
                const LeaderBoardHeading(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
