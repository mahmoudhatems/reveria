

  import 'package:flutter/material.dart';

Widget buildBlogCard(String title, String category, IconData icon) {
    return SizedBox(
      width: 200,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 30, color: Colors.orange),
              const SizedBox(height: 8),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(category, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
