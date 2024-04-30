// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:leaderboard/utils/reward_card.dart';

class RewardPage extends StatelessWidget {
  const RewardPage({super.key});

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
              "Rewards for Leads:",
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              width: 400,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rewards",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Leads",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    RewardCard(
                      imagePath: 'lib/Images/ipad.png',
                      itemName: 'Ipad/Iphone',
                      leads: '100',
                    ),
                    RewardCard(
                      imagePath: 'lib/Images/item2.png',
                      itemName: 'Dubai Trip Safari',
                      leads: '75',
                    ),
                    RewardCard(
                      imagePath: 'lib/Images/item3.png',
                      itemName: 'Della Event',
                      leads: '50',
                    ),
                    RewardCard(
                      imagePath: 'lib/Images/item4.png',
                      itemName: 'Comedy Funny Tickets',
                      leads: '40',
                    ),
                    RewardCard(
                      imagePath: 'lib/Images/item5.png',
                      itemName: 'Gypsy Soul',
                      leads: '35',
                    ),
                    RewardCard(
                      imagePath: 'lib/Images/item6.png',
                      itemName: 'Offline Event',
                      leads: '25',
                    ),
                    RewardCard(
                      imagePath: 'lib/Images/item7.png',
                      itemName: 'Imagica',
                      leads: '20',
                    ),
                    RewardCard(
                      imagePath: 'lib/Images/item8.png',
                      itemName: 'Classic Watch',
                      leads: '10',
                    ),
                    RewardCard(
                      imagePath: 'lib/Images/item9.png',
                      itemName: 'Movie Ticket',
                      leads: '5',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
