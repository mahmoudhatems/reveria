
  import 'package:flutter/material.dart';
import 'package:reveria/core/features/home/widgets/build_weekly_report_card.dart';

Widget buildWeekReportGrid() {
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
        buildWeeklyReportCard("Steps", "697,978", Icons.directions_walk),
        buildWeeklyReportCard("Workout", "6h 45min", Icons.fitness_center),
        buildWeeklyReportCard("Water", "10,659 ml", Icons.water_drop),
        buildWeeklyReportCard("Sleep", "29h 17min", Icons.bed),
      ],
    );
  }

