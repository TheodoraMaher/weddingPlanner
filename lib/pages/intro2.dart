
import 'package:flutter/material.dart';
import 'package:weddingplaner/pages/profile.dart';

import '../constants.dart';
import 'favorite.dart';
import 'login_page.dart';

class secondscreen extends StatelessWidget {
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
        title: Text('WeddingPlanner',
            style: TextStyle(fontSize: 25.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/img_4.png',
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 172,
                      width: 311,
                      child: Column(
                        children: [
                          Text(
                            "No time to waste when you need your coffee",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "We’ve crafted a quick and easy way for you to order your favorite coffee or treats thats fast!",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/we.jpg',
                  height: 100,
                  width: 100,
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
