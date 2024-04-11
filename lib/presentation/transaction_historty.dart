import 'package:flutter/material.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Enhanced sample data for the transactions
    final List<Map<String, dynamic>> transactions = List.generate(20, (index) {
      return {
        "department": "Dept ${index + 1}",
        "dateTime": "2024-04-11 10:00",
        "type": index % 2 == 0 ? "credit" : "debit",
        "amount": 20 + index,
      };
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transaction History',
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
      body: Container(
        color: Colors.grey[100], // Optional: subtle background color
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            Color amountColor =
                transaction["type"] == "credit" ? Colors.green : Colors.red;
            IconData icon = transaction["type"] == "credit"
                ? Icons.arrow_downward
                : Icons.arrow_upward;

            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: Card(
                elevation: 4, // Elevated cards
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: amountColor.withOpacity(0.1),
                    child: Icon(icon, color: amountColor),
                  ),
                  title: Text(
                    transaction["department"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(transaction["dateTime"]),
                  trailing: Text(
                    "${transaction["type"] == "debit" ? '-' : '+'}\$${transaction["amount"]}",
                    style: TextStyle(
                        color: amountColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
