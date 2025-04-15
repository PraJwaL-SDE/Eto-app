import 'package:flutter/material.dart';

class ServiceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(),
              Center(child: Text("Passengers")),
              Divider(),
              Image.asset("assets/images/service/pana.png"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\u2022 Book your Passengers ride services with two distinct segments like 3 seaters and 5 seaters."),
                  Text("\u2022 Children under the age of eight have not paid for rides."),
                  Text("\u2022 Day ride services or Night ride services are available in town."),
                  Text("\u2022 If there are more than six persons, you must book more than one e-rickshaw to prevent violating any of our policies and to save money and time."),
                ],
              ),
              Divider(),
              Center(child: Text("Goods")),
              Divider(),
              Image.asset("assets/images/service/service_goods.png"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\u2022 To transport commodities such as tables, chairs, sacks of rice, wheat, or anything else that an e-rickshaw can carry, book your ride."),
                  Text("\u2022 Goods transport work is going only on day shift."),
                  Text("\u2022 If you need to transport extra goods, please book additional e-rickshaws based on your needs rather than overloading them."),
                  Text("\u2022 As a regular citizen or as a store owner, anyone can make a booking for a place."),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
