import 'package:flutter/material.dart';

import '../../../utils/constant_color.dart';

class DriverPickupDetail extends StatelessWidget {
  const DriverPickupDetail({super.key});

  @override
  Widget build(BuildContext context) {
    String time = "05 min";
    String address = "1207 W.Jersey St. Mortreal, 57867";
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            child: Center(
              child: Text(
                "We Believe in pure safety of passenger 👍",
                style: TextStyle(fontSize: 17),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Your driver is on\n the way",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text("Pickup in",style: TextStyle(color: Colors.white, ),),
                            Text(
                              time,
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ConstantColor.primary,
                        ),
                        Text(address,style: TextStyle(color: Colors.white, ),),
                        Spacer(),
                        Icon(Icons.arrow_forward,color: Colors.white,),
                      ],
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
