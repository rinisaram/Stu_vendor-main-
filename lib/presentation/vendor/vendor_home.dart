import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stu_vendor_main/presentation/vendor/deposit.dart';

import '../transaction_historty.dart';

class VendorScreen extends StatefulWidget {
  const VendorScreen({Key? key}) : super(key: key);

  @override
  State<VendorScreen> createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  List<String> barcodes = []; // List to store barcode strings

  @override
  void initState() {
    super.initState();
    initializeHive();
    loadBarcodes();
  }

  Future<void> initializeHive() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.openBox<String>('barcodes');
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) {
      if (!mounted) return;
      if (barcode != '-1') {
        saveBarcode(barcode);
      }
    });
  }

  void saveBarcode(String barcode) async {
    var box = Hive.box<String>('barcodes');
    await box.add(barcode);
    loadBarcodes();
    showBarcodeSavedDialog(barcode);
  }

  Future<void> loadBarcodes() async {
    var box = Hive.box<String>('barcodes');
    setState(() {
      barcodes = box.values.toList();
    });
  }

  void deleteBarcode(int index) async {
    var box = Hive.box<String>('barcodes');
    await box.deleteAt(index); // Delete the item at the index
    loadBarcodes(); // Reload barcodes after deletion
  }

  void showBarcodeSavedDialog(String barcode) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Barcode Scanned"),
          content: Text("The scanned barcode is: $barcode"),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startBarcodeScanStream();
        },
        child: Icon(Icons.qr_code_2_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Vendor's Profile",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20.0),
            _buildProfileCard(
                "Cashier Name: Hari\nCashier ID: 8c\nDept no: TOCH21353",
                context),
            const SizedBox(height: 20.0),
            _buildProfileCard("Balance \$200000", context, isBalanceCard: true),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildElevatedButton(context, "Transaction History", () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TransactionHistory(),
                    ),
                  );
                }),
                _buildElevatedButton(context, "Deposit", () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DepositPage(),
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(height: 20.0),
            Text('History of scanned barcodes', style: TextStyle(fontSize: 20)),
            Expanded(
              child: ListView.builder(
                itemCount: barcodes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(barcodes[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteBarcode(index),
                    ),
                  );
                },
              ),
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
