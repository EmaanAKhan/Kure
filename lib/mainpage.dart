import 'package:flutter/material.dart';
import 'home.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image and KURE text in a Row
            Row(
              mainAxisSize: MainAxisSize.min, // Prevents extra horizontal space
              children: [
                // Your image (adjust width/height as needed)
                Image.asset('assets/images/kure.jpeg',
                    width: 122,
                    height: 117,
                    errorBuilder: (_, __, ___) => Icon(Icons.image, size: 60)),
                const SizedBox(width: 15), // Spacing between image and text
                // KURE Text
                Text(
                  "KURE",
                  style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                    color: Color(0xd9053119),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Welcome Text
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 54,
                fontWeight: FontWeight.bold,
                color: const Color(0xff636d52),
              ),
            ),
            const SizedBox(height: 40),
            // GET STARTED Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                backgroundColor: Color(0xffaad786),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "GET STARTED",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
