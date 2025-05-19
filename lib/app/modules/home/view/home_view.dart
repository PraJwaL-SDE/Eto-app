import 'package:eto_ride/app/core/services/location_service.dart';
import 'package:eto_ride/app/data/models/location_model.dart';
import 'package:eto_ride/app/modules/common/view/pickup_and_drop_card.dart';
import 'package:eto_ride/app/modules/common/view/ride_searching_popup.dart';
import 'package:eto_ride/app/modules/home/view/user_widget/driver_detail_option.dart';
import 'package:eto_ride/app/modules/home/view/user_widget/driver_pickup_detail.dart';
import 'package:eto_ride/app/modules/home/view/user_widget/search_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/constant/colors/constant_colors.dart';
import '../../../data/models/ServiceModel.dart';
import '../../../data/models/passenger_model.dart';
import '../../../data/provider/service_data.dart';
import '../../common/view/continue_btn.dart';
import '../../common/view/service_tab_btn.dart';
import '../controller/home_controller.dart'; // Import your HomeController

class HomeView extends GetView<HomeController> {
  final Passenger passenger;

  HomeView({super.key, required this.passenger}) {
    controller.passenger = passenger;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () {
          return Stack(
            children: <Widget>[
              // Positioned widget to place the card at the center bottom
              if (controller.isLocationLoading.value)
                Positioned.fill(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: ConstantColors.primary,
                    ),
                  ),
                ),

              if (controller.showPickupDrop.value && !controller.isLocationLoading.value)
                Positioned(
                  bottom: 20, // Distance from the bottom
                  left: MediaQuery.of(context).size.width *
                      0.01, // Center horizontally with padding
                  right: MediaQuery.of(context).size.width * 0.01,
                  child: AnimatedContainer(
                    duration:
                        const Duration(milliseconds: 300), // Animation duration
                    curve: Curves.easeInOut, // Animation curve
                    height: controller.showSearchLocation.value
                        ? MediaQuery.of(context).size.height *
                            0.85 // Expanded height
                        : MediaQuery.of(context).size.height *
                            0.21, // Collapsed height
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(0, 3), // Shadow below the container
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PickupAndDropCard(
                          start: controller.start.value,
                          destination: controller.destination.value,
                          updatePickup: () {
                            controller.showSearchLocation.value =
                                true; // Expand the container
                            controller.updatingPickup.value = true;
                          },
                          updateDrop: () {
                            controller.showSearchLocation.value =
                                true; // Expand the container
                            controller.updatingDrop.value = true;
                          },
                          onPickupChanged: (text) {
                            controller.searchLocation(text);
                            controller.updatingPickup.value = true;
                            controller.updatingDrop.value = false;
                            if (!controller.showSearchLocation.value) {
                              controller.showSearchLocation.value = true;
                            }
                          },
                          onDropChanged: (text) {
                            controller.searchLocation(text);
                            controller.updatingPickup.value = false;
                            controller.updatingDrop.value = true;
                            if (!controller.showSearchLocation.value) {
                              controller.showSearchLocation.value = true;
                            }
                          },
                          pickupTextEditingController:
                              controller.pickupTextEditingController,
                          dropoffTextEditingController:
                              controller.dropoffTextEditingController,
                        ),
                        if (controller.showSearchLocation.value)
                          Expanded(
                            child: _searchResults(controller.searchLocations,
                                isPickup: true),
                          ),
                      ],
                    ),
                  ),
                ),
              if (controller.showServiceList.value)
                Positioned(
                  bottom: 20,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  child: serviceList(),
                ),

              if (controller.showSearchingLoading.value)
                Positioned(
                  bottom: 20,
                  child: IntrinsicWidth(child: RideSearchingPopup()),
                ),

              if (controller.showDriverDetail.value)
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: IntrinsicWidth(
                    child: Column(
                      spacing: 10,
                      mainAxisSize: MainAxisSize.min,
                      children: [DriverPickupDetail(), DriverDetailOptions()],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
  // 0 for pick and 1 for drop

  Widget _searchResults(List<LocationModel> locations, {bool isPickup = true}) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        final location = locations[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 8.0),
          child: GestureDetector(
            onTap: () {
              if (controller.updatingPickup.value) {
                controller.updatingPickup.value = false;
                controller.start.value = location;
                controller.pickupTextEditingController.text = location.name;
              } else if (controller.updatingDrop.value) {
                controller.updatingDrop.value = false;
                controller.destination.value = location;
                controller.dropoffTextEditingController.text = location.name;
              }

              controller.collapseAll();
              controller.showServiceList.value = true;
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.location_pin,
                    color: ConstantColors.primary, size: 24),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        location.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis, // Handle long text
                      ),
                      if (location.address.isNotEmpty)
                        Text(
                          location.address,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
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

  Widget serviceList() {
    controller.collapseAll();
    controller.showServiceList.value = true;

    final ValueNotifier<int> _selectedTabIndex = ValueNotifier(0);
    final PageController _pageController = PageController();

    void _onTabSelected(int index) {
      _selectedTabIndex.value = index;
      _pageController
          .jumpToPage(index); // Instantly switch to the selected page
    }

    void _onPageChanged(int index) {
      _selectedTabIndex.value = index;
    }

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
            ValueListenableBuilder<int>(
              valueListenable: _selectedTabIndex,
              builder: (context, selectedIndex, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => _onTabSelected(0),
                      child: ServiceTabBtn(
                        text: "Passenger",
                        selected: selectedIndex == 0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _onTabSelected(1),
                      child: ServiceTabBtn(
                        text: "Goods",
                        selected: selectedIndex == 1,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 5),
            // PageView for tabs
            SizedBox(
              height: 500, // Fixed height for PageView
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
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
                controller.start.value,
                controller.destination.value,
              ),
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
                      (index) => GestureDetector(
                        onTap: () => controller.selectService(recommendedList[index]),
                        child: RecommondedListItem(
                          servicemodel: recommendedList[index],
                        ),
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => CouponCodeScreen(),
                  //   ),
                  // );
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
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SelectPaymentScreen(),
                  //   ),
                  // );
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
                onPressed: () {},
                text: "Book Your Ride",
                backgroundColor: ConstantColors.primary,
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
                  controller.start.value, controller.destination.value),
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
                  color: ConstantColors.primary,
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

// GoogleMap(
//   onMapCreated: controller.onMapCreated, // Use controller's method
//   initialCameraPosition: CameraPosition(
//     target: controller.center.value, // Use controller's observable
//     zoom: 11.0,
//   ),
//   markers: controller.markers.toSet(), // Use controller's markers
// ),
