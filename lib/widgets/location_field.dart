import 'package:flutter/material.dart';
import '/utils/constants.dart';

class LocationField extends StatelessWidget {
  const LocationField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * .6,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(8),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_pin, color: Const.kPrimary),
            SizedBox(width: 8),
            Expanded(child: Text("My Location")),
            Icon(Icons.keyboard_arrow_down_sharp, color: Const.kPrimary)
          ],
        ),
      ),
    );
  }
}
