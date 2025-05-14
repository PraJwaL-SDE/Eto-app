import 'package:eto_ride/app/core/constant/colors/constant_colors.dart';
import 'package:eto_ride/app/data/models/location_model.dart';
import 'package:flutter/material.dart';

class SearchDropdownWidget extends StatelessWidget {
  final List<LocationModel> locations;

  SearchDropdownWidget({super.key, required this.locations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        final location = locations[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 8.0),
          child: GestureDetector(
            onTap: (){

            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.location_pin, color: ConstantColors.primary, size: 24),
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
}
