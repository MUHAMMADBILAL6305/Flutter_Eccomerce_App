import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'address_detail_screen.dart';
import 'forgot_password.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignIn Screen'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Email ID'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('SignIn'),
              onPressed: () => Get.to(AddressDetailScreen()),
            ),
            SizedBox(height: 30),
            GestureDetector(
              child: Text('Forgot Password?',style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              ),
              onTap: ()=> Get.to(ForgotPasswordScreen()),
            )
          ],
        ),
      ),
    );
  }
}
