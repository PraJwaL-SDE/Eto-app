import 'dart:async';

import 'package:eto_ride/models/ServiceModel.dart';
import 'package:eto_ride/screens/bottom_nav/widgets/driver_detail_options.dart';
import 'package:eto_ride/screens/bottom_nav/widgets/driver_pickup_detail.dart';
import 'package:eto_ride/services/service_data.dart';
import 'package:eto_ride/widgets/continue_btn.dart';
import 'package:eto_ride/widgets/ride_searching_popup.dart';
import 'package:eto_ride/widgets/service_tab_btn.dart';
import 'package:flutter/material.dart';
import 'package:eto_ride/utils/constant_color.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../coupon/coupon_code_screen.dart';
import '../payment/select_payment_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showRideSearching = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 8), () {
      setState(() {
        _showRideSearching = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: FlutterMap(
            options: MapOptions(
              initialCenter:
                  LatLng(51.509364, -0.128928), // Center the map over London
              initialZoom: 15,
            ),
            children: [
              TileLayer(
                // Bring your own tiles
                urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
                userAgentPackageName:
                    'com.example.app', // Add your app identifier
                // And many more recommended properties!
              ),
            ],
          )),
          Positioned(
            top: 100,
            left: 5,
            right: 5,
            child: pickAndDrop(),
          ),
          // Positioned(
          //   top: 240,
          //   left: 5,
          //   right: 5,
          //   child: _showRideSearching ? RideSearchingPopup() : serviceList(),
          //
          // ),

          Positioned(
            top: 340,
            left: 5,
            right: 5,
            child: DriverPickupDetail(),
          ),
          Positioned(
            top: 540,
            left: 5,
            right: 5,
            child: DriverDetailOptions(),
          ),

        ],
      ),
    );
  }

  Widget pickAndDrop() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
        side: BorderSide(
            color: ConstantColor.primary, width: 1.5), // Primary border
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content at the top
          children: [
            // Left side: Vertical dots and line
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top dot
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: ConstantColor.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                // Vertical line
                Container(
                  width: 2,
                  height: 60,
                  color: ConstantColor.primary,
                ),
                // Bottom dot
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16), // Spacing between line and text
            // Right side: Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pick-up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text(
                    "My current location",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Divider(color: Colors.grey), // Divider line
                  Text(
                    "Drop-off",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text(
                    "3517 W. Gray St. Utice",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceList() {
    PageController _pageController = PageController();

    int _selectedTabIndex = 0;

    return StatefulBuilder(
      builder: (context, setState) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Choose Your Service",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                // Tabs with GestureDetector
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = 0;
                          _pageController
                              .jumpToPage(0); // Instantly switch to page 0
                        });
                      },
                      child: ServiceTabBtn(
                        text: "Passenger",
                        selected: _selectedTabIndex == 0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = 1;
                          _pageController
                              .jumpToPage(1); // Instantly switch to page 1
                        });
                      },
                      child: ServiceTabBtn(
                        text: "Goods",
                        selected: _selectedTabIndex == 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // PageView for tabs
                SizedBox(
                  height: 500, // Fixed height for PageView
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _selectedTabIndex = index;
                      });
                    },
                    children: [
                      passengerTab(), // Passenger tab content
                      goodsTab(), // Goods tab content
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget passengerTab() {
    final ServiceData serviceData = ServiceData();

    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Recommended for you",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            FutureBuilder<List<Servicemodel>>(
              future: serviceData.getRecommondedPassengerList(
                  LatLng(0, 0), LatLng(0, 0)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Failed to load data: ${snapshot.error}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text("No recommended services available."),
                    ),
                  );
                }

                // Display the list of recommended services
                final List<Servicemodel> recommendedList = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      recommendedList.length,
                      (index) => RecommondedListItem(
                        servicemodel: recommendedList[index],
                      ),
                    ),
                  ),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CouponCodeScreen(),
                    ),
                  );
                },
                child: OtherOptionTile(
                  imagePath: "assets/images/coupon2.png",
                  title: "3 Coupons Available",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: OtherOptionTile(
                imagePath: "assets/images/eto_coin.png",
                title: "100 Eto Coins Available",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectPaymentScreen(),
                    ),
                  );
                },
                child: OtherOptionTile(
                  imagePath: "assets/images/payment_mode.png",
                  title: "Payment Mode",
                ),
              ),
            ),
            // Add padding to avoid overlapping with the bottom navigation bar
            const SizedBox(height: 16),
            Text("You can pay via cash or UPI for your ride"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ContinueBtn(
                onPressed: () {

                },
                text: "Book Your Ride",
                backgroundColor: ConstantColor.primary,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget goodsTab() {
    final ServiceData serviceData = ServiceData();

    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Recommended for you",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            FutureBuilder<List<Servicemodel>>(
              future: serviceData.getRecommondedPassengerList(
                  LatLng(0, 0), LatLng(0, 0)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Failed to load data: ${snapshot.error}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text("No recommended services available."),
                    ),
                  );
                }

                // Display the list of recommended services
                final List<Servicemodel> recommendedList = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      recommendedList.length,
                      (index) => RecommondedListItem(
                        servicemodel: recommendedList[index],
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ContinueBtn(
                onPressed: () {},
                text: "Select Ride",
                backgroundColor: Colors.black,
                showArrow: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RecommondedListItem extends StatelessWidget {
  final Servicemodel servicemodel;
  final bool selected;

  const RecommondedListItem({
    super.key,
    required this.servicemodel,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: selected ? Colors.black : Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Vehicle image
          Image.asset(
            "assets/images/get_started_screen_image.png",
            width: 60,
            height: 60,
          ),

          // Vehicle info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  servicemodel.vehicleType,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.timer, size: 14, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      DateTime.now().difference(servicemodel.time).inMinutes <
                              60
                          ? "${DateTime.now().difference(servicemodel.time).inMinutes} min"
                          : "${DateTime.now().difference(servicemodel.time).inHours} hr",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(width: 10),
                    Icon(Icons.person, size: 14, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      "${servicemodel.seats.toString()} seats",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),

          // Price info
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Final price
              Text(
                "₹${servicemodel.finalPrice.toStringAsFixed(2)}",
                style: TextStyle(
                  color: ConstantColor.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              // Initial price (shown only if not null)
              if (servicemodel.initialPrice != null)
                Text(
                  "₹${servicemodel.initialPrice!.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class OtherOptionTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isNetworkImage;

  const OtherOptionTile({
    super.key,
    required this.imagePath,
    required this.title,
    this.isNetworkImage = false, // Default is local asset
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE6F7FF), // Very light blue background

      child: ListTile(
        leading: _buildImage(),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
          size: 18,
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: isNetworkImage
            ? Image.network(imagePath, fit: BoxFit.cover)
            : Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}
