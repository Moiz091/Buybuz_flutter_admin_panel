import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static const String routName = '\ProductScreen';

  Widget rowHeader(String text, int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: const Color(0xff444444),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Products Screen',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Row(
            children: [
              rowHeader('Image', 1),
              rowHeader('Name', 1),
              rowHeader('Price ', 1),
              rowHeader('Quantity', 1),
              rowHeader('Action', 1),
              rowHeader('View More', 1),
            ],
          )
        ],
      ),
    );
  }
}
