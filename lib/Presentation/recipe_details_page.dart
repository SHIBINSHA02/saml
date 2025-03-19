import 'package:flutter/material.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Map<String, dynamic> recipeData; // Store the recipe data

  RecipeDetailsPage({required this.recipeData}); // Constructor to accept data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            recipeData['recipe_name'] ?? 'Recipe'), // Default title if null
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding for better layout
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ingredients:', // Ingredients header
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              // Display ingredients with images
              ...recipeData['ingredients']?.map<Widget>((ingredient) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${ingredient['name']}: ${ingredient['quantity']}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                            height:
                                8), // Space between ingredient text and image
                        Image.network(
                          ingredient['image_url'] ??
                              'https://via.placeholder.com/100', // Default image if null
                          height: 100, // Set a fixed height for the images
                          fit: BoxFit
                              .cover, // Adjust the image to cover the space
                        ),
                        SizedBox(height: 4), // Space between image and URL
                      ],
                    );
                  }).toList() ??
                  [], // Handle null case for ingredients
              SizedBox(height: 20), // Space between ingredients and steps
              Text(
                'Steps:', // Steps header
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              // Display steps
              ...recipeData['steps']?.map<Widget>((step) {
                    return Text(
                      '${step['index']}. ${step['step_name']}: ${step['description']}', // Ensure these keys exist
                      style: TextStyle(fontSize: 16),
                    );
                  }).toList() ??
                  [], // Handle null case for steps
              SizedBox(height: 20), // Space before conclusion
              Text(
                'Conclusion:', // Conclusion header
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                recipeData['conclusion'] ??
                    'No conclusion available.', // Default conclusion if null
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
