import 'package:flutter/material.dart';
import 'package:weddingplaner/pages/profile.dart';

import '../constants.dart';
import '../widgets/custom_button.dart';
import 'aboutus.dart';
import 'favorite.dart';


class ContactUsForm extends StatefulWidget {
  static String id = 'contact';

  @override
  State<ContactUsForm> createState() => _ContactUsFormState();
}

class _ContactUsFormState extends State<ContactUsForm> {
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
        title: Text('Contact Us',
            style: TextStyle(fontSize: 25.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(

          children: [
          CircleAvatar(
          radius: 110,
          backgroundImage: AssetImage('assets/images/we.jpg'),
        ),

            SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Icon(Icons.person),
                SizedBox( width: 20,),
                Text('theo ,  mallos'),
              ],
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Icon(Icons.email),
                SizedBox( width: 20,),
                Text('wedding@gmail.com'),
              ],
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox( width: 20,),
                Text('015547815'),
              ],
            ),
            SizedBox(height: 100),
            CustomButon(
              onTap: ()  {
                Navigator.pushNamed(context, AboutUsPage.id);

              },
              text: 'about us',
            ),
          ],
        ),
      ),
    );
  }
}