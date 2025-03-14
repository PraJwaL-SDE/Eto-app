import 'package:eto_ride/screens/payment/widgets/payment_type_tile.dart';
import 'package:flutter/material.dart';

import '../../widgets/ride_searching_popup.dart';

class SelectPaymentScreen extends StatefulWidget {
  const SelectPaymentScreen({super.key});

  @override
  State<SelectPaymentScreen> createState() => _SelectPaymentScreenState();
}

class _SelectPaymentScreenState extends State<SelectPaymentScreen> {
  String _selectedPayment = "Online Payment"; // To track the selected payment method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Payment Method",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Online Payment",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            PaymentTypeTile(
              icon: const Icon(Icons.credit_card, color: Colors.blue),
              title: "Online Payment",
              isSelected: _selectedPayment == "Online Payment",
              onTap: () {
                setState(() {
                  _selectedPayment = "Online Payment";
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Cash",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            PaymentTypeTile(
              icon: const Icon(Icons.money, color: Colors.green),
              title: "Cash",
              isSelected: _selectedPayment == "Cash",
              onTap: () {
                setState(() {
                  _selectedPayment = "Cash";
                });
              },
            ),
            const SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}
