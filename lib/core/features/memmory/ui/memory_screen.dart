import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reveria/core/theming/colors.dart';

class MemoryAidScreen extends StatelessWidget {
  // Sample data for the memory items
  final List<Map<String, String>> memoryList = [
    {
      'name': 'Mahmoud Hatem',
      'relationship': 'Friend',
      'memoryNote': 'We met at the park and had coffee together.',
      'imageUrl': 'assets/images/Hatem JR.jpg', 
    },
    {
      'name': 'Omar Abdelazim',
      'relationship': 'Friend',
      'memoryNote': 'We went to the cinema and watched a movie together.',
      'imageUrl': 'assets/images/omar.jpg', 
    },
    {
      'name': 'Mostafa Lutfy',
      'relationship': 'Friend',
      'memoryNote': 'We went to the beach and had a great time.',
      'imageUrl': 'assets/images/mostafa.jpg', 
    },
    {
      'name': 'Khalid Hany',
      'relationship': 'Friend',
      'memoryNote': 'We went to the gym and worked out together.',
      'imageUrl': 'assets/images/khaled.jpg', 
    },
    {
      'name': 'Omar Asklany',
      'relationship': 'Friend',
      'memoryNote': 'We went to the park and played football together.',
      'imageUrl': 'assets/images/asklany.jpg', 
    },
    {
      'name': 'Mai Salah',
      'relationship': 'Friend',
      'memoryNote': 'We went to the mall and had lunch together.',
      'imageUrl': 'assets/images/mai.jpg', 
    },
    
    
  ];

   MemoryAidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: ListView.builder(
          itemCount: memoryList.length,
          itemBuilder: (context, index) {
            var memory = memoryList[index];
            return MemoryCard(
              personName: memory['name']!,
              relationship: memory['relationship']!,
              memoryNote: memory['memoryNote']!,
              imageUrl: memory['imageUrl']!,
            );
          },
        ),
      ),
    );
  }
}

class MemoryCard extends StatelessWidget {
  final String personName;
  final String relationship;
  final String memoryNote;
  final String imageUrl;

  const MemoryCard({
    Key? key,
    required this.personName,
    required this.relationship,
    required this.memoryNote,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsManager.primaryColorbackLight,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(12.h),
        child: Row(
          children: [
            // Person's Photo
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                imageUrl,
                width: 70.w,
                height: 70.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.w), // Space between image and text

            // Person's Details and Memory
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Person's Name and Relationship
                  Text(
                    personName,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.textTeal,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    relationship,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.textGray,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // Memory Note
                  Text(
                    memoryNote,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontStyle: FontStyle.italic,
                      color: ColorsManager.textGray,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // "Tap to view" Button
            IconButton(
              icon: Icon(Icons.arrow_forward, color: ColorsManager.primaryColorTeal),
              onPressed: () {
                // You can add navigation or logic for tapping to view more details
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MemoryDetailScreen(personName: personName, memoryNote: memoryNote)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MemoryDetailScreen extends StatelessWidget {
  final String personName;
  final String memoryNote;

  const MemoryDetailScreen({
    Key? key,
    required this.personName,
    required this.memoryNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$personName - Memory'),
        backgroundColor: ColorsManager.primaryColorTeal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              personName,
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.textTeal,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              memoryNote,
              style: TextStyle(
                fontSize: 20.sp,
                color: ColorsManager.textGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
