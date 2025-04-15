import 'package:eto_ride/app/core/constant/colors/constant_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/symbols/constant_symbol.dart';

class RideCompletePopup extends StatelessWidget {
  const RideCompletePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: ConstantColors.primary.withOpacity(0.4),
                shape: BoxShape.circle
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: ConstantColors.primary.withOpacity(0.6),
                    shape: BoxShape.circle
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ConstantColors.primary.withOpacity(0.8),
                        shape: BoxShape.circle
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ConstantColors.primary,
                          shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Icon(Icons.check,color: Colors.white,),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Text("Ride Completed",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
          Text("Amount to Received",style: TextStyle(fontSize: 20,),),
          Text("${ConstantSymbol.INR} 30.00", style: TextStyle(color: ConstantColors.primary,fontSize: 35,fontWeight: FontWeight.bold,),)

        ],
      ),
    );
  }
}
