import 'package:flutter/material.dart';

import 'login_student.dart';
import 'vendor/vendor_home.dart';
import 'vendor/vendor_login.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Spacer for consistent spacing
    final spacer = SizedBox(height: MediaQuery.of(context).size.height * 0.05);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900], // Enhanced AppBar design
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blueGrey[800]!, // Gradient start color
              Colors.blueGrey[200]!, // Gradient end color
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                spacer,
                _buildButton(
                  context,
                  'Student',
                  Icons.school,
                  Colors.green[600]!,
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPageStudnet();
                        },
                      ),
                    );
                  },
                ),
                spacer,
                _buildButton(
                  context,
                  'Vendor',
                  Icons.store,
                  Colors.orange[600]!,
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return  LoginPageVendor();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
    VoidCallback onPressed, // Added function parameter
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed, // Use the passed function parameter
      icon: Icon(icon, size: 24),
      label: Text(
        label,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        // primary: color,

        // onPrimary: Colors.white,
        minimumSize: const Size(200, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
