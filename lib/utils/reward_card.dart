import 'package:flutter/material.dart';

class RewardCard extends StatelessWidget {
  final String imagePath;
  final String itemName;
  final String leads;
  const RewardCard(
      {super.key,
      required this.imagePath,
      required this.itemName,
      required this.leads});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 95,
      // decoration: BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePath,
                        width: 100,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 130,
                            child: Text(
                              itemName,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.grey.shade600,
                    ),
                    Text(
                      leads,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
