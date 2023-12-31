import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/custom_button.dart';
import 'favorite.dart';
import 'login_page.dart';

class profile extends StatelessWidget {
  static String id = 'profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: KSecondaryColor,

        title: Text('profile',
            style: TextStyle(fontSize: 25.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileRow(label: 'Name', value: 'user name'),
            ProfileRow(label: 'Email', value: 'user@gmail.com'),
            ProfileRow(label: 'Gender', value: 'feMale'),
            ProfileRow(label: 'Age', value: '20'),
            Spacer(), // Adds empty space to push the button to the bottom
            CustomButon(
              onTap: ()  {
                Navigator.pushNamed(context, LoginPage.id);

              },
              text: 'logout',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final String label;
  final String value;

  const ProfileRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 20),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}