import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weddingplaner/constants.dart';
import 'package:weddingplaner/pages/category.dart';
import 'package:weddingplaner/pages/favorite.dart';
import 'package:weddingplaner/pages/product.dart';
import 'package:weddingplaner/pages/profile.dart';
import 'package:http/http.dart' as http;

import '../model/productmodel.dart';
import '../widgets/bottonNavigationbar.dart';

class productsEvent extends StatefulWidget {
  const productsEvent({Key? key}) : super(key: key);

  static String id = 'products';

  @override
  State<productsEvent> createState() => _productsEventState();
}
class _productsEventState extends State<productsEvent> {

  // List<String> images = [
  //   'assets/images/we.jpg',
  //   'assets/images/we.jpg',
  //   'assets/images/we.jpg',
  //   'assets/images/we.jpg',
  //   'assets/images/we.jpg',
  //   'assets/images/we.jpg',
  //   'assets/images/we.jpg',
  //   'assets/images/we.jpg',
  //   'assets/images/we.jpg',
  //   'assets/images/we.jpg',
  //   'assets/images/we.jpg',
  //   'assets/images/we.jpg',
  //   'assets/images/we.jpg',
  //   'assets/images/we.jpg',
  //   'assets/images/we.jpg',
  //   'assets/images/we.jpg',
  // ];
  //
  // List<String> title = [
  //   'Title1',
  //   'title2',
  //   'title3',
  //   'title4',
  //   'Title1',
  //   'title2',
  //   'title3',
  //   'title4',
  //   'Title1',
  //   'title2',
  //   'title3',
  //   'title4',
  //   'Title1',
  //   'title2',
  //   'title3',
  //   'title4'
  // ];
  //
  // List<String> desc = [
  //   'shoping1',
  //   'shoping2',
  //   'shoping3',
  //   'shoping4',
  //   'shoping1',
  //   'shoping2',
  //   'shoping3',
  //   'shoping4',
  //   'shoping1',
  //   'shoping2',
  //   'shoping3',
  //   'shoping4',
  //   'shoping1',
  //   'shoping2',
  //   'shoping3',
  //   'shoping4',
  // ];

  // List<productModel> productlist =[];
  // getAllproduct() async {
  //   String path = 'http://192.168.1.7:8000/GetallProduct';
  //   final response = await http.get(Uri.parse(path));
  //   if (response.statusCode == 200){
  //     List responseAfterDecode = jsonDecode(response.body);
  //     for(var pl in responseAfterDecode){
  //       productlist.add(productModel.fromJson(pl));
  //     }
  //   }
  // }
  // @override
  // void initState(){
  //   getAllproduct();
  //   super.initState();
  // }


  int isLoaded = 0;
  List<productModel> productList = [];

  getallproduct() async {
    try {
      productList = [];
      isLoaded = 0;
      String path = 'http://172.20.10.7:8000/GetallProduct';
      final response = await http.get(Uri.parse(path));

      if (response.statusCode == 200) {
        List ResponseAfterDecode = jsonDecode(response.body);
        for (var per in ResponseAfterDecode) {
          productList.add(productModel.fromJson(per));
        }

        if (productList.isEmpty) {
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
    getallproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Container(

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
                child: GridView.builder(
                  itemCount: productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, productDetailes.id);

                      },
                      child: Container(
                        height:150,
                        width: double.infinity,
                        margin: EdgeInsets.all(10),
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
                                          // productList[index].placeImage!,
                                          'assets/images/we.jpg',
                                          fit: BoxFit.cover,
                                          height: 100,
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
                                              Navigator.push(
                                                  context, MaterialPageRoute(builder: (context) => fav()));
                                            },
                                            icon: Icon(Icons.favorite, color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                              Text(
                                productList[index].placeName!,

                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                productList[index].description!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                productList[index].address!,
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

      // bottomNavigationBar: bottonnavbar(),

    );
  }

}
