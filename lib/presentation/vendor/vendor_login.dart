import 'package:flutter/material.dart';
import 'dart:async'; 

import 'vendor_home.dart'; 

class LoginPageVendor extends StatelessWidget {
  LoginPageVendor({Key? key}) : super(key: key);

  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendor Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _studentIdController,
              decoration: InputDecoration(
                labelText: 'Vendor ID',
                hintText: 'Enter your ID',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.perm_identity),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _login(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[800],
                  minimumSize: Size(double.infinity, 50)),
              child: Text('Login',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    if (_studentIdController.text.isEmpty || _passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: const Text("Please enter all fields"),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible:
            false, 
        builder: (BuildContext context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Text("Logging in..."),
                ],
              ),
            ),
          );
        },
      );

      // Wait for 2 seconds
      Timer(Duration(seconds: 2), () {
        Navigator.of(context).pop();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const VendorScreen()),
        );
      });
    }
  }
}
