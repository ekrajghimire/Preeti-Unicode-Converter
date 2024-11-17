import 'package:flutter/material.dart';
import 'package:preeti_unicode_converter/logic/type_in_nepali_logic.dart';
import 'package:preeti_unicode_converter/logic/type_in_nepali_logic.dart'; // Import the conversion logic file for Type in Nepali

class TypeInNepaliScreen extends StatefulWidget {
  @override
  _TypeInNepaliScreenState createState() => _TypeInNepaliScreenState();
}

class _TypeInNepaliScreenState extends State<TypeInNepaliScreen> {
  TextEditingController _inputController = TextEditingController();
  String outputText = "";

  // Function to convert Romanized text to Nepali text
  void convertToNepali() {
    setState(() {
      outputText = typeInNepali(
          _inputController.text); // Call the conversion logic function
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE70010), // Nepal Red color
        title: Text(
          'Type in Nepali',
          style: TextStyle(
              fontWeight: FontWeight.bold, // Bold title
              fontSize: 20,
              color: Colors.white),
        ),
        centerTitle: true,
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title Text
            Text(
              "Enter Romanized Text to Convert to Nepali",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30), // Space between title and input field

            // Input Field to Enter Romanized Text
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                hintText: "Enter Romanized Text", // Hint text for input
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20), // Space between input field and button

            // Convert Button
            ElevatedButton(
              onPressed: convertToNepali,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600, // Button color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Convert to Nepali",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 30), // Space between button and output field

            // Output Text Field
            Text(
              "Output:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10), // Space between output label and field
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SelectableText(
                outputText,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
