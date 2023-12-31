import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weddingplaner/pages/aboutus.dart';
import 'package:weddingplaner/pages/category.dart';
import 'package:weddingplaner/pages/contactus.dart';
import 'package:weddingplaner/pages/login_page.dart';
import 'package:weddingplaner/pages/product.dart';
import 'package:weddingplaner/pages/products.dart';
import 'package:weddingplaner/pages/profile.dart';
import 'package:weddingplaner/pages/resgister_page.dart';
import 'package:weddingplaner/pages/splashscreen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,


      // map b2dr arbot ben string ale hwa al key bta3yw vlue
      // ale hwa al wadjet ale 3awz arg3ha lma aktb al sting da
      routes:{
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        categoryEvent.id: (context) => categoryEvent(),
        productsEvent.id: (context) => productsEvent(),
        productDetailes.id : (context) => productDetailes(),
        profile.id :  (context) => profile(),
        SplashScreen.id  : (context) => SplashScreen(),
        ContactUsForm.id  : (context) => ContactUsForm(),
        AboutUsPage.id  : (context) => AboutUsPage(),
      },
      initialRoute:  SplashScreen.id ,
    );
  }
}

