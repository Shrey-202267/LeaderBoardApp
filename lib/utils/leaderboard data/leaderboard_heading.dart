import 'package:flutter/material.dart';
import 'package:leaderboard/utils/leaderboard%20data/scoreboardData.dart';

class LeaderBoardHeading extends StatefulWidget {
  const LeaderBoardHeading({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LeaderBoardHeadingState createState() => _LeaderBoardHeadingState();
}

class _LeaderBoardHeadingState extends State<LeaderBoardHeading> {
  String activeElement = "Week";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeElement = "Week";
                  });
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 33, vertical: 7),
                    color:
                        activeElement == "Week" ? Colors.yellow : Colors.white,
                    child: const Text(
                      "Week",
                      style: TextStyle(
                        color: Color.fromARGB(255, 38, 38, 38),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeElement = "Month";
                  });
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 33, vertical: 10),
                    color:
                        activeElement == "Month" ? Colors.orange : Colors.white,
                    child: const Text(
                      "Month",
                      style: TextStyle(
                        color: Color.fromARGB(255, 38, 38, 38),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeElement = "Year";
                  });
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 33, vertical: 10),
                    color:
                        activeElement == "Year" ? Colors.green : Colors.white,
                    child: const Text(
                      "Year",
                      style: TextStyle(
                        color: Color.fromARGB(255, 38, 38, 38),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ScoreBoardData(activeElement: activeElement),
      ],
    );
  }
}
