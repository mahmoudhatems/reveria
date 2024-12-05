


  import 'package:flutter/material.dart';
import 'package:reveria/core/features/home/widgets/build_blog_card.dart';

Widget buildBlogsList() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildBlogCard(
              "More about Apples: Benefits, nutrition, and tips", "Nutrition", Icons.local_dining),
          buildBlogCard(
              "The secret to maximizing your health", "Lifestyle", Icons.nature_people),
        ],
      ),
    );
  }