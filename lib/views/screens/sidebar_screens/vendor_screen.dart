import 'package:flutter/material.dart';
import 'package:web_admin/views/screens/sidebar_screens/widgets/vendor_widget.dart';

class VendorScreen extends StatelessWidget {
  static const String routName = '\VendorScreen';

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
              'Manage Vendors',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Row(
            children: [
              rowHeader('Logo', 1),
              rowHeader('Business Name', 2),
              rowHeader('City', 2),
              rowHeader('State', 2),
              rowHeader('Action', 1),
              rowHeader('View  More', 1),
            ],
          ),
          VendorWidget(),
        ],
      ),
    );
  }
}
