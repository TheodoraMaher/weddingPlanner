import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weddingplaner/pages/products.dart';
import 'package:weddingplaner/pages/profile.dart';

import '../constants.dart';
import 'package:http/http.dart' as http;

import '../model/categorymodel.dart';
import 'favorite.dart';


class categoryEvent extends StatefulWidget {
  const categoryEvent({Key? key}) : super(key: key);
  static String id = 'category page';

  @override
  State<categoryEvent> createState() => _categoryEventState();
}

class _categoryEventState extends State<categoryEvent> {

  // List<String> text = [
  //   'villa ',
  //   'Home',
  //   'Wedding',
  //   'Engagement',
  //   'BirthDay',
  //   'Beach Event',
  //   'Restaurant',
  //   'Baby Gender'
  // ];





  int isLoaded = 0;
  List<categoryModel> categoryList = [];

  getallcategory() async {
    try {
      categoryList = [];
      isLoaded = 0;
      String path = 'http://172.20.10.7:8000/GetallEvent';
      final response = await http.get(Uri.parse(path));

      if (response.statusCode == 200) {
        List ResponseAfterDecode = jsonDecode(response.body);
        for (var per in ResponseAfterDecode) {
          categoryList.add(categoryModel.fromJson(per));
        }

        if (categoryList.isEmpty) {
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
    getallcategory();
  }

  // List<category> categorylist =[];
  // getAllCategory() async {
  //   String path = 'http://192.168.1.7:8000/GetallEvent';
  //   final response = await http.get(Uri.parse(path));
  //   if (response.statusCode == 200){
  //     List responseAfterDecode = jsonDecode(response.body);
  //     for(var cl in responseAfterDecode){
  //       categorylist.add(category.fromJson(cl));
  //     }
  //   }
  // }
  // @override
  // void initState(){
  //   getAllCategory();
  //   super.initState();
  // }

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
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
              itemCount: categoryList.length,
              itemBuilder: (context,index){

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, productsEvent.id);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        padding: EdgeInsets.all(30),

                        child:Row(
                          children: [

                            Text(categoryList[index].yourEvent!,
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.navigate_next, color: Colors.black),

                          ],
                        )

                    ),
                  ),
                );
              })
      ),
    );
  }
}
