import 'package:flutter/material.dart';
import 'package:weddingplaner/pages/product.dart';
import 'package:weddingplaner/pages/profile.dart';

import '../constants.dart';

class fav extends StatefulWidget {
  const fav({Key? key}) : super(key: key);
  static String id = 'fav page';
  @override
  State<fav> createState() => _favState();
}

class _favState extends State<fav> {
  List<String> images = [
    'assets/images/we.jpg',
    'assets/images/we.jpg',
    'assets/images/we.jpg',
    'assets/images/we.jpg',
    'assets/images/we.jpg',
    'assets/images/we.jpg',
    'assets/images/we.jpg',
    'assets/images/we.jpg',
    'assets/images/we.jpg',
    'assets/images/we.jpg',
    'assets/images/we.jpg',
    'assets/images/we.jpg',
    'assets/images/we.jpg',
    'assets/images/we.jpg',
    'assets/images/we.jpg',
    'assets/images/we.jpg',
  ];

  List<String> title = [
    'Title1',
    'title2',
    'title3',
    'title4',
    'Title1',
    'title2',
    'title3',
    'title4',
    'Title1',
    'title2',
    'title3',
    'title4',
    'Title1',
    'title2',
    'title3',
    'title4'
  ];

  List<String> desc = [
    'shoping1',
    'shoping2',
    'shoping3',
    'shoping4',
    'shoping1',
    'shoping2',
    'shoping3',
    'shoping4',
    'shoping1',
    'shoping2',
    'shoping3',
    'shoping4',
    'shoping1',
    'shoping2',
    'shoping3',
    'shoping4',
  ];


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
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Container(

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
                child: GridView.builder(
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, productDetailes.id);

                      },
                      child: Container(
                        height:150,
                        width: double.infinity,
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: KSecondaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 100,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          images[index],
                                          fit: BoxFit.cover,
                                          height: 120,
                                          width: double.infinity,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(15),
                                            ),
                                            // color: Colors.transparent.withOpacity(0.6),
                                          ),
                                          child: IconButton(
                                            onPressed: () {

                                            },
                                            icon: Icon(Icons.favorite, color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                              Text(
                                title[index],

                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                desc[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // mainAxisSpacing: 5,
                    // crossAxisSpacing: 5,
                  ),
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
