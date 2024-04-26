// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:leaderboard/utils/banner_card.dart';
import 'package:leaderboard/utils/birthday_card.dart';
import 'package:leaderboard/utils/companies_card.dart';
import 'package:leaderboard/utils/performers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
              padding: const EdgeInsets.only(right: 15, top: 20),
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
      body: ListView(children: [
        Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 190,
              width: 400,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  BannerCard(
                    ImagePath: 'lib/Images/Image1.png',
                  ),
                  BannerCard(
                    ImagePath: 'lib/Images/Image2.png',
                  ),
                  BannerCard(
                    ImagePath: 'lib/Images/Image4.png',
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/spinner');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 2,
                          blurRadius: 10),
                    ],
                  ),
                  width: 350,
                  height: 170,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Spin &",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Text(
                                "Win",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: 200,
                        height: 180,
                        child: Image.asset(
                          "lib/Images/spinner.png",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 400,
              height: 160,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  Performers(
                    mainTitle: 'Performers of Year',
                    imagepath1: 'lib/Images/person1.png',
                    name1: 'Lalit kondekar',
                    imagepath2: 'lib/Images/person2.png',
                    name2: 'Lokesh Burade',
                    imagepath3: 'lib/Images/person3.png',
                    name3: 'Shreyash J',
                  ),
                  Performers(
                    mainTitle: 'Performers of Month',
                    imagepath1: 'lib/Images/person4.png',
                    name1: 'Abhishekh G',
                    imagepath2: 'lib/Images/person5.png',
                    name2: 'Pratik Pandey',
                    imagepath3: 'lib/Images/person6.png',
                    name3: 'Pratik Pandey',
                  ),
                  Performers(
                    mainTitle: 'Performers of Week',
                    imagepath1: 'lib/Images/person7.png',
                    name1: 'Prathamesh S',
                    imagepath2: 'lib/Images/person8.png',
                    name2: 'Raj Shende',
                    imagepath3: 'lib/Images/person9.png',
                    name3: 'Tejas P',
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shop & Earn",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 340,
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CompaniesCard(
                        companyImage: "lib/Images/amazon.png",
                      ),
                      CompaniesCard(
                        companyImage: "lib/Images/flipkart.png",
                      ),
                      CompaniesCard(
                        companyImage: "lib/Images/zomato.png",
                      ),
                      CompaniesCard(
                        companyImage: "lib/Images/lenskart.png",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 400,
              height: 160,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  BirtDayCard(
                    imagePath: 'lib/Images/person5.png',
                    name: 'Shreyash J',
                    color1: Color(0XFF38344a),
                    color2: Color(0xFF691ad1),
                  ),
                  BirtDayCard(
                    imagePath: 'lib/Images/person2.png',
                    name: 'Pratik Pandey',
                    color1: Color(0XFF23644c),
                    color2: Color(0xFF1a63d1),
                  ),
                  BirtDayCard(
                    imagePath: 'lib/Images/person3.png',
                    name: 'Lokesh Burade',
                    color1: Color(0XFF38344a),
                    color2: Color(0xFF691ad1),
                  ),
                  BirtDayCard(
                    imagePath: 'lib/Images/person6.png',
                    name: 'Abhishek Gupta',
                    color1: Color(0XFFcc4c49),
                    color2: Color(0xFF7e6013),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ]),
    );
  }
}
