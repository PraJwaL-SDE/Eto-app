import 'package:eto_ride/app/core/constant/colors/constant_colors.dart';
import 'package:flutter/material.dart';

enum CoinTxn { DEBIT, CREDIT }

class CoinTxnListItem extends StatelessWidget {
  final CoinTxn type;

  const CoinTxnListItem({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          leading: Image.asset(
            type == CoinTxn.DEBIT
                ? "assets/images/coin/debit_coin.png"
                : "assets/images/coin/coin.png",
            width: 40,
            height: 40,
          ),
          title: Text(
            type == CoinTxn.DEBIT ? "Debit" : "Credit",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            "9 July, 06:30",
            style: TextStyle(color: Colors.grey),
          ),
          trailing: Text(
            type == CoinTxn.DEBIT ? "1 coin" : "0.25 coin",
            style: TextStyle(
              color: type == CoinTxn.DEBIT ? Colors.redAccent : ConstantColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
