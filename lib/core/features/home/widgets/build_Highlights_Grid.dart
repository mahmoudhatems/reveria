


  import 'package:flutter/material.dart';
import 'package:reveria/core/features/home/widgets/build_highlight_card.dart';

Widget buildHighlightsGrid() {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.5,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      children: [
        buildHighlightCard(Icons.directions_walk, "Steps", "11,857", Colors.blue),
        buildHighlightCard(Icons.calendar_today, "Cycle tracking", "12 days before period", Colors.orange),
        buildHighlightCard(Icons.bed, "Sleep", "7h 31min", Colors.indigo),
        buildHighlightCard(Icons.local_dining, "Nutrition", "960 kcal", Colors.purple),
      ],
    );
  }
