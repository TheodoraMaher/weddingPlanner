import 'package:flutter/material.dart';
import 'package:weddingplaner/pages/profile.dart';

import '../constants.dart';
import 'favorite.dart';

class AboutUsPage extends StatelessWidget {
  static String id = 'about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: KSecondaryColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => fav()));
            },
            icon: Icon(Icons.favorite, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => profile()));
            },
            icon: Icon(Icons.person, color: Colors.white),
          ),
        ],
        title: Text('About Us',
            style: TextStyle(fontSize: 25.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Story',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Text(
                      'Here at Company X, our journey began with a passion for innovation and a commitment to delivering the best to our customers. We strive to create products that make a difference and build relationships that last.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Image.asset(
                  'assets/images/we.jpg', // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}