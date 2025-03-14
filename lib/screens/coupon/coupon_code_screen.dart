import 'package:eto_ride/screens/coupon/widgets/coupon_code_item.dart';
import 'package:flutter/material.dart';

class CouponCodeScreen extends StatefulWidget {
  const CouponCodeScreen({super.key});

  @override
  State<CouponCodeScreen> createState() => _CouponCodeState();
}

class _CouponCodeState extends State<CouponCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Apply Coupon Code",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          CouponCodeItem(),
          CouponCodeItem(),
          CouponCodeItem(),
        ],
      ),
    );
  }
}
