import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class buyersWidget extends StatefulWidget {
  @override
  _buyerWidgetState createState() => _buyerWidgetState();
}

class _buyerWidgetState extends State<buyersWidget> {
  final Stream<QuerySnapshot> _orderStrem =
      FirebaseFirestore.instance.collection('users').snapshots();

  Widget userData(Widget widget, int? flex) {
    return Expanded(
      flex: flex!,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _orderStrem,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: LinearProgressIndicator());
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: ((context, index) {
            final vendor = snapshot.data!.docs[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                userData(
                    Container(
                      height: 50,
                      width: 50,
                      child: vendor['profileImage'] == ""
                          ? Image.network(
                              "https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_1280.png")
                          : Image.network(
                              vendor['profileImage'],
                              width: 50,
                              height: 50,
                            ),
                    ),
                    1),
                userData(
                    Text(
                      vendor['fullName'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    3),
                userData(
                    Text(
                      vendor['email'] +
                          " " +
                          vendor['phoneNumber'] +
                          vendor['address'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    2),
                userData(
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () async {},
                      child: Text(
                        'reject',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    1),
              ],
            );
          }),
        );
      },
    );
  }
}
