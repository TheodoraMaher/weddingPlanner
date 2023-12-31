
import 'package:flutter/material.dart';
import 'package:weddingplaner/pages/profile.dart';

import '../constants.dart';
import 'favorite.dart';
import 'intro2.dart';
import 'login_page.dart';


class MyHomePage extends StatelessWidget {
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
                      'assets/images/we.jpg',
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
                            "Choose and customize your drinks with simplicity",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "You want your drink and you want it your way, so be bold and customize the way that makes you the happiest",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),

                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/img_1.png',
                  height: 100,
                  width: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the SecondScreen when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => secondscreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff4B2C20),
                  ),
                  child: Text(
                    'bottom',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
