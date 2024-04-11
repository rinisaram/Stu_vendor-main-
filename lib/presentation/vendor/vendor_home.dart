import 'package:flutter/material.dart';
import '../transaction_historty.dart';
import 'widget/qrcode_widget.dart';

class VendorScreen extends StatelessWidget {
  const VendorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return BarcodeDisplayScreen();
              },
            ),
          );
        },
        child: Icon(Icons.qr_code_2_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Vendor's",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Profile",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            _buildProfileCard(
              "Cashir Name: Hari\nCashirId: 8c\nDept no: TOCH21353",
              context,
            ),
            const SizedBox(height: 20.0),
            _buildProfileCard(
              "Balance \$200000",
              context,
              isBalanceCard: true,
            ),
            const SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildElevatedButton(context, "Transaction History", () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const TransactionHistory();
                      },
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(String text, BuildContext context,
      {bool isBalanceCard = false}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0, 2),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isBalanceCard ? 20 : 16,
          fontWeight: isBalanceCard ? FontWeight.bold : FontWeight.normal,
          color: isBalanceCard ? Colors.black87 : Colors.black54,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildElevatedButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Colors.blueGrey[800], // Consistent button color
        onPrimary: Colors.white, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
