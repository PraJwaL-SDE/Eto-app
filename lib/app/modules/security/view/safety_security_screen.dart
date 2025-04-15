import 'package:flutter/material.dart';

class SafetySecurityScreen extends StatelessWidget {
  const SafetySecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text("Safety & Security",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: const Text(
                  "What precautions are there for the security of female riders?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "We take severe precautions to guarantee the safety of each of our female riders since we value your safety above everything else. Any incident during the ride can be handled by our Incident Response Team, who is on call around the clock. If you reserve a ride, you can contact them by using the SOS button. We also protect our female riders' privacy with a number masking tool.",
                    ),
                  ),
                ],
              ),
            ),

            const Divider(),
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: const Text(
                  "What precautions are there for the security of female riders?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "We take severe precautions to guarantee the safety of each of our female riders since we value your safety above everything else. Any incident during the ride can be handled by our Incident Response Team, who is on call around the clock. If you reserve a ride, you can contact them by using the SOS button. We also protect our female riders' privacy with a number masking tool.",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
