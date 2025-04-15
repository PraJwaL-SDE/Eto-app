import 'dart:math';
import 'package:eto_ride/app/modules/coins/view/widgets/coin_txn_list_item.dart';
import 'package:flutter/material.dart';

class CoinTransactionScreen extends StatelessWidget {
  const CoinTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var random = Random();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Coin Transactions",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, idx) {
                  // Randomize between DEBIT and CREDIT
                  final type = random.nextBool() ? CoinTxn.DEBIT : CoinTxn.CREDIT;
                  return CoinTxnListItem(type: type);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
