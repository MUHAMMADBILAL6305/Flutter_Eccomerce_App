import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password Screen'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Email ID'),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Send Reset Link'),
              onPressed: () => Get.to(ForgotPasswordScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
