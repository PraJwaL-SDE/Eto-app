import 'package:eto_ride/app/data/models/location_model.dart';
import 'package:eto_ride/app/modules/common/view/app_text_field.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/colors/constant_colors.dart';

class PickupAndDropCard extends StatelessWidget {
  final LocationModel start;
  final LocationModel destination;
  final VoidCallback updatePickup;
  final VoidCallback updateDrop;
  final Function(String) onPickupChanged;
  final Function(String) onDropChanged;
  final TextEditingController pickupTextEditingController;
  final TextEditingController dropoffTextEditingController;

  PickupAndDropCard({
    required this.start,
    required this.destination,
    this.updatePickup = _defaultCallback,
    this.updateDrop = _defaultCallback,
    required this.onPickupChanged,
    required this.onDropChanged,
    TextEditingController? pickupTextEditingController, // Optional with a default value
    TextEditingController? dropoffTextEditingController, // Optional with a default value
  })  : pickupTextEditingController = pickupTextEditingController ?? TextEditingController(),
        dropoffTextEditingController = dropoffTextEditingController ?? TextEditingController();

  static void _defaultCallback() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: ConstantColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 2,
                height: 60,
                color: ConstantColors.primary,
              ),
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
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: updatePickup,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pick-up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      AppTextField(
                        controller:pickupTextEditingController,
                        hintText: start.name,
                        onChanged: onDropChanged,
                        textStyle: TextStyle(color: Colors.grey),
                        showBorder: false,
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.grey),
                GestureDetector(
                  onTap: updateDrop,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Drop-off",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      AppTextField(
                        controller: dropoffTextEditingController,
                        onChanged: onDropChanged,
                        hintText: destination.name,
                        textStyle: TextStyle(color: Colors.grey),
                        showBorder: false,
                        padding: EdgeInsets.zero,
                      ),
                      // Text(
                      //   destination.name,
                      //   style: TextStyle(color: Colors.grey),
                      //   overflow: TextOverflow.ellipsis,
                      //   maxLines: 1,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
