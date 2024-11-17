import 'package:flutter/material.dart';
import 'package:preeti_unicode_converter/logic/conversion_logic.dart';

class PreetiToUnicodeScreen extends StatefulWidget {
  @override
  _PreetiToUnicodeScreenState createState() => _PreetiToUnicodeScreenState();
}

class _PreetiToUnicodeScreenState extends State<PreetiToUnicodeScreen> {
  TextEditingController _inputController = TextEditingController();
  String outputText = "";

  // Function to convert Preeti to Unicode using the conversion logic
  void convertPreetiToUnicode() {
    setState(() {
      outputText = preetiToUnicode(
          _inputController.text); // Call the conversion logic function
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE70010), // Nepal Red color
        title: const Text(
          'Preeti to Unicode',
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
            colors: [
              Colors.blue.shade500,
              Colors.blue.shade600
            ], // Gradient for Nepalese theme
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter Preeti Text to Convert",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),

            // Input Field to Enter Preeti Text
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                hintText: "Enter Preeti Text", // Hint text for input
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            // Convert Button
            ElevatedButton(
              onPressed: convertPreetiToUnicode,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600, // Button color
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Convert to Unicode",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),

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
