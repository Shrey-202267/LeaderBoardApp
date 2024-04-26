import 'package:flutter/material.dart';

class CompaniesCard extends StatelessWidget {
  final String companyImage;
  const CompaniesCard({super.key, required this.companyImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        width: 160,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, spreadRadius: 2, blurRadius: 10),
          ],
        ),
        child: Image.asset(
          companyImage,
        ),
      ),
    );
  }
}
