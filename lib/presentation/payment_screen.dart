import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For input formatters

class PaymentGatewayScreen extends StatelessWidget {
  const PaymentGatewayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Enhanced AppBar design

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment Gateway',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.blueGrey[800],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Complete Your Payment",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _buildTextField(context, "Amount", TextInputType.number,
                  Icons.monetization_on),
              _buildTextField(context, "Card Number", TextInputType.number,
                  Icons.credit_card),
              _buildTextField(
                  context, "Cardholder Name", TextInputType.text, Icons.person),
              Row(
                children: [
                  Expanded(
                      child: _buildTextField(context, "Expiry Date",
                          TextInputType.datetime, Icons.calendar_today)),
                  const SizedBox(width: 20),
                  Expanded(
                      child: _buildTextField(
                          context, "CVV", TextInputType.number, Icons.lock)),
                ],
              ),
              const SizedBox(height: 20.0),
              Center(
                child: Icon(
                  Icons.verified_user, // Icon for security reassurance
                  color: Colors.green[800],
                  size: 40,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Pay Now",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[800],
                  // primary: Colors.green[800], // Enhanced button color
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Rounded button edges
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label,
      TextInputType keyboardType, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon,
              color:
                  Colors.blueGrey[800]), // Prefix icon for better user guidance
          enabledBorder: OutlineInputBorder(
            // Custom border style
            borderSide: BorderSide(color: Colors.blueGrey.shade100),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            // Custom border style on focus
            borderSide: BorderSide(color: Colors.blueGrey.shade800),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        inputFormatters: keyboardType == TextInputType.number
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,
      ),
    );
  }
}
