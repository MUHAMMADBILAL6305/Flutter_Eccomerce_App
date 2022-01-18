import 'package:eccomerce_app_practice/screens/category_listenig_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'forgot_password.dart';


class AddressDetailScreen extends StatelessWidget {
  const AddressDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address Detail Screen'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Cell No'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email Id'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Delivery Address'),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Next'),
              onPressed: () => Get.to(CategoryListeningScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
