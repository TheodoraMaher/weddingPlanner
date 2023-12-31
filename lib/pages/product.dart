import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weddingplaner/constants.dart';
import 'package:weddingplaner/pages/favorite.dart';
import 'package:http/http.dart' as http;
import 'package:weddingplaner/pages/profile.dart';

import '../constants.dart';
import '../model/productdetailesmodel.dart';
import '../widgets/custom_button.dart';
import 'contactus.dart';

class productDetailes extends StatefulWidget {
  const productDetailes({Key? key}) : super(key: key);
  static String id = 'product';

  @override
  State<productDetailes> createState() => _productDetailesState();
}

class _productDetailesState extends State<productDetailes> {


  int isLoaded = 0;
  List<productdetailesModel> productdetailesList = [];

  getallproductDetailes() async {
    try {
      productdetailesList = [];
      isLoaded = 0;
      String path = 'http://172.20.10.7:8000/GetallProductDetails';
      final response = await http.get(Uri.parse(path));

      if (response.statusCode == 200) {
        List ResponseAfterDecode = jsonDecode(response.body);
        for (var per in ResponseAfterDecode) {
          productdetailesList.add(productdetailesModel.fromJson(per));
        }

        if (productdetailesList.isEmpty) {
          isLoaded = 3;
        } else {
          isLoaded = 1;
        }
      } else {
        isLoaded = 2;
      }
    } catch (e) {
      print('Error: $e');
      isLoaded = 2;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getallproductDetailes();
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/d.jpg',
                width: double.infinity),
            SizedBox(
                height: 10
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start (left)
                children: [
                  Text('product Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('10000 LE',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text('    20000 LE',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'descriiiiiiiiiiiiiiiibe hhhhhhhhhhhhhhh /n hhhhhhhhhhhhhhhhhhh eeeeeeeeeeeeeee hhhhhhhhhhhh eeeeeeeeeeeeee',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 20),
                  Text(

                    'up tp 200 guests',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 70,
            ),

            CustomButon(
              onTap: ()  {
                Navigator.pushNamed(context, ContactUsForm.id);
              },
              text: 'Contact for Availability',
            ),





          ],

        ),
      ),


    );
  }
}
