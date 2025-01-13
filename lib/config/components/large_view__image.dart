import 'package:flutter/material.dart';

class ImageView {
  static void showLargeImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: FutureBuilder(
          future: _loadImage(imageUrl),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error, color: Colors.red, size: 50),
                    const SizedBox(height: 10),
                    const Text("Failed to load image"),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Close"),
                    ),
                  ],
                ),
              );
            } else {
              return InteractiveViewer(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        "Unable to display image",
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }

  static Future<void> _loadImage(String url) async {
    try {
      final uri = Uri.parse(url);
      if (!uri.isAbsolute) {
        throw Exception("Invalid URL");
      }
    } catch (e) {
      throw Exception("Error loading image: $e");
    }
  }
}
