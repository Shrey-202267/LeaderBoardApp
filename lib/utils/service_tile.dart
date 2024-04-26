// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:leaderboard/utils/sub_service.dart';

class ServiceTile extends StatefulWidget {
  const ServiceTile({super.key});

  @override
  State<ServiceTile> createState() => _ServiceTileState();
}

class _ServiceTileState extends State<ServiceTile> {
  bool isVisible = false;
  double container_height = 70;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (container_height == 70) {
              container_height = 200;
              isVisible = true;
            } else {
              container_height = 70;
              isVisible = false;
            }
          });
        },
        child: Container(
          width: 400,
          height: container_height,
          decoration: BoxDecoration(),
          child: Column(
            children: [
              Divider(
                color: Colors.grey.shade500,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.business),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'TWJ IT',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Visibility(
                  visible: isVisible,
                  child: Container(
                    width: 400,
                    height: 110,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SubService(),
                            SubService(),
                            SubService(),
                            SubService(),
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
