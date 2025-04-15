import 'package:eto_ride/app/modules/payment/view/widgets/txn_list_item.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transactions"),),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
                itemBuilder: (context,index){
              return TxnListItem();
            }),
          )

        ],
      ),
    );
  }
}
