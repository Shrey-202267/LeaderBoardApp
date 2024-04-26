import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaderboard/utils/service_tile.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Color(0xFF461d9f),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
          leading: Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/drawer');
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                    )),
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: Container(
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "lib/Images/coin.png",
                      width: 20,
                    ),
                    Text(
                      '99',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Text(
              "Company Services:",
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
                child: ListView(
              children: [
                ServiceTile(),
                ServiceTile(),
                ServiceTile(),
                ServiceTile(),
                ServiceTile(),
                ServiceTile(),
                ServiceTile(),
                ServiceTile(),
                ServiceTile(),
                ServiceTile(),
                ServiceTile(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
