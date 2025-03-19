import 'dart:convert'; // For JSON handling
import 'package:flutter/material.dart'; // Import Flutter Material package
import 'package:flutter/services.dart'; // For loading assets
import 'Presentation/presentation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures binding is initialized
  final String response = await rootBundle.loadString(
      'assets/Presentation/sooji_halwa_recipe.json'); // Corrected path
  final data = json.decode(response); // Decode JSON data

  runApp(MyApp(data: data)); // Run the app with the loaded data
}

class MyApp extends StatelessWidget {
  final Map<String, dynamic> data; // Store the recipe data

  MyApp({required this.data}); // Constructor to accept data

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PresentationPage(recipeData: data), // Pass data to PresentationPage
    );
  }
}
