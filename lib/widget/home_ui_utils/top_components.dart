import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopHomeScreen extends StatelessWidget {
  final String? locationName;
  final String? detailDate;

  const TopHomeScreen(this.locationName, this.detailDate, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: EdgeInsets.all(16.0),
        // Background color similar to the image
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_pin, // Location pin icon
                  color: Color(0xFF24448F),
                  // Match the blue color in the image
                  size: 24.0,
                ),
                SizedBox(width: 8.0), // Space between icon and text
                Text(
                  locationName ?? "Ha Noi",
                  style: TextStyle(
                    fontSize: 24.0,

                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    color: Color(
                      0xFF24448F,
                    ), // Match the text color in the image
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0), // Space between "Location" and date/time
            Text(
              detailDate ?? 'Monday, 1 January 10:00',
              style: TextStyle(
                fontSize: 16.0,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.normal,
                color: Colors.lightBlue, // Lighter text color for date/time
              ),
            ),
          ],
        ),
      ),
    );
  }
}
