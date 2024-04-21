import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For input formatters

class DepositPage extends StatefulWidget {
  const DepositPage({Key? key}) : super(key: key);

  @override
  _DepositPageState createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  final TextEditingController _amountController = TextEditingController();
  String _transactionStatus = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Deposit Funds',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter amount to deposit',
                border: OutlineInputBorder(),
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _processDeposit,
              child: const Text('Deposit Now'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _transactionStatus,
              style: const TextStyle(fontSize: 18, color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _processDeposit() {
    // Mock a payment processing and update transaction status
    // You would replace this with actual payment gateway integration code
    if (_amountController.text.isEmpty) {
      setState(() {
        _transactionStatus = "Please enter a valid amount.";
      });
      return;
    }

    final amount = int.parse(_amountController.text);
    if (amount <= 0) {
      setState(() {
        _transactionStatus = "Amount must be greater than zero.";
      });
      return;
    }

    // Simulate a successful or failed transaction
    // This would be replaced by actual response handling from your payment gateway
    setState(() {
      _transactionStatus = "Deposit of \$$amount was successful!";
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }
}
