import 'package:flutter/material.dart';
import 'package:leaderboard/utils/leaderboard%20data/month-data.dart';
import 'package:leaderboard/utils/leaderboard%20data/week-data.dart';
import 'package:leaderboard/utils/leaderboard%20data/year-data.dart';

class ScoreBoardData extends StatefulWidget {
  final String activeElement;

  const ScoreBoardData({Key? key, required this.activeElement})
      : super(key: key);

  @override
  _ScoreBoardDataState createState() => _ScoreBoardDataState();
}

class _ScoreBoardDataState extends State<ScoreBoardData> {
  @override
  Widget build(BuildContext context) {
    Widget dataWidget;

    if (widget.activeElement == "Week") {
      dataWidget = WeekData();
    } else if (widget.activeElement == "Month") {
      dataWidget = MonthData();
    } else {
      dataWidget = YearData();
    }

    return Container(
      height: 370,
      width: 500,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: dataWidget,
        ),
      ),
    );
  }
}
