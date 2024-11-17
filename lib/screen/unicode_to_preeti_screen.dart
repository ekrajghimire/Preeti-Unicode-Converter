import 'package:flutter/material.dart';
import 'package:preeti_unicode_converter/logic/unicode_to_preeti_logic.dart';

class UnicodeToPreetiScreen extends StatefulWidget {
  @override
  _UnicodeToPreetiScreenState createState() => _UnicodeToPreetiScreenState();
}

class _UnicodeToPreetiScreenState extends State<UnicodeToPreetiScreen> {
  TextEditingController _inputController = TextEditingController();
  String outputText = "";

  // Function to convert Unicode to Preeti using the conversion logic
  void convertUnicodeToPreeti() {
    setState(() {
      outputText = unicodeToPreeti(
          _inputController.text); // Call the conversion logic function
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE70010),
        title: const Text(
          'Unicode to Preeti',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade500, Colors.blue.shade600], // Gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter Unicode Text to Convert",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30), // Space between title and input field

            // Input Field to Enter Unicode Text
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                hintText: "Enter Unicode Text", // Hint text for input
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20), // Space between input field and button

            // Convert Button
            ElevatedButton(
              onPressed: convertUnicodeToPreeti,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600, // Button color
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Convert to Preeti",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30), // Space between button and output field

            // Output Text Field
            const Text(
              "Output:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10), // Space between output label and field
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SelectableText(
                outputText,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Note: The app might not be accurate because it is made for learning purpose.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white54,
              ),
            )
          ],
        ),
      ),
    );
  }
}
