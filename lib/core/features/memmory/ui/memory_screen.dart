import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reveria/core/theming/colors.dart';



class MemoryAidScreen extends StatelessWidget {
  final List<Map<String, String>> memoryList = [
    {
      'name': 'Mahmoud Hatem',
      'relationship': 'Friend',
      'memoryNote': 'We met at the park and had coffee together.',
      'date': '1 December 2024',
      'tag': 'Outing',
      'imageUrl': 'assets/images/Hatem JR.jpg',
    },
    {
      'name': 'Omar Abdelazim',
      'relationship': 'Friend',
      'memoryNote': 'We went to the cinema and watched a movie together.',
      'date': '4 December 2024',
      'tag': 'Leisure',
      'imageUrl': 'assets/images/omar.jpg',
    },
    {
      'name': 'Mostafa Lutfy',
      'relationship': 'Friend',
      'memoryNote': 'We went to the beach and had a great time.',
      'date': '25 January 2024',
      'tag': 'Vacation',
      'imageUrl': 'assets/images/mostafa.jpg',
    },
    {
      'name': 'Khalid Hany',
      'relationship': 'Friend',
      'memoryNote': 'We went to the gym and worked out together.',
      'date': '10 April  2024',
      'tag': 'Fitness',
      'imageUrl': 'assets/images/khaled.jpg',
    },
    {
      'name': 'Omar Asklany',
      'relationship': 'Friend',
      'memoryNote': 'We went to the park and played football together.',
      'date': '18 March 2024',
      'tag': 'Sports',
      'imageUrl': 'assets/images/asklany.jpg',
    },
    {
      'name': 'Mai Salah',
      'relationship': 'Friend',
      'memoryNote': 'We went to the mall and had lunch together.',
      'date': '30 January  2024',
      'tag': 'Shopping',
      'imageUrl': 'assets/images/mai.jpg',
    },
  ];

  MemoryAidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: ListView.builder(
          itemCount: memoryList.length,
          itemBuilder: (context, index) {
            var memory = memoryList[index];
            return MemoryCard(
              personName: memory['name']!,
              relationship: memory['relationship']!,
              memoryNote: memory['memoryNote']!,
              date: memory['date']!,
              tag: memory['tag']!,
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
  final String date;
  final String tag;
  final String imageUrl;

  const MemoryCard({
    Key? key,
    required this.personName,
    required this.relationship,
    required this.memoryNote,
    required this.date,
    required this.tag,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 240, 240, 247).withOpacity(0.4),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      elevation:0,
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
            SizedBox(width: 16.w),

            // Person's Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and Tag
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        personName,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.textTeal,
                        ),
                      ),
                      Chip(
                        label: Text(
                          tag,
                          style: TextStyle(fontSize: 12.sp, color: Colors.white),
                        ),
                        backgroundColor: ColorsManager.primaryColorTeal,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "$relationship | $date",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.textGray,
                    ),
                  ),
                  SizedBox(height: 8.h),
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

            // View Button
            IconButton(
              icon: Icon(Icons.arrow_forward, color: ColorsManager.primaryColorTeal),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemoryDetailScreen(
                      personName: personName,
                      memoryNote: memoryNote,
                      relationship: relationship,
                      date: date,
                      imageUrl: imageUrl,  // Pass imageUrl
                    ),
                  ),
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
  final String relationship;
  final String date;
  final String imageUrl;

  const MemoryDetailScreen({
    Key? key,
    required this.personName,
    required this.memoryNote,
    required this.relationship,
    required this.date,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$personName - Memory', style: TextStyle( color: ColorsManager.primaryColorTeal, fontWeight: FontWeight.w500),),
        backgroundColor: ColorsManager.white,
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: ColorsManager.primaryColorTeal),
            onPressed: () {
              _shareMemory(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  imageUrl,
                  width: 150.w,
                  height: 150.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              personName,
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.textTeal,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '$relationship | $date',
              style: TextStyle(fontSize: 16.sp, color: ColorsManager.textGray),
            ),
            SizedBox(height: 16.h),
            Text(
              memoryNote,
              style: TextStyle(
                fontSize: 20.sp,
                color: ColorsManager.textGray,
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Add edit logic here
                    _editMemory(context);
                  },
                  icon: Icon(Icons.edit),
                  label: Text('Edit Memory'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.white,
                  ),
                ),
                ElevatedButton.icon(
                  
                  onPressed: () {
                    // Add delete logic here
                    _deleteMemory(context);
                  },
                  icon: Icon(Icons.delete, color: ColorsManager.white),
                  label: Text('Delete Memory',style: TextStyle(
                    color: ColorsManager.white,fontWeight: FontWeight.w500
                  ),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.red,
                  ),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                // Add call logic here
                _callContact(context);
              },
              icon: Icon(Icons.phone),
              label: Text('Call $personName'),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _shareMemory(BuildContext context) {
    // Add your share logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Memory Shared!')),
    );
  }

  void _editMemory(BuildContext context) {
    // Add your edit logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit this memory!')),
    );
  }

  void _deleteMemory(BuildContext context) {
    // Add your delete logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Memory Deleted!')),
    );
  }

  void _callContact(BuildContext context) {
    // Add your call logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Calling $personName!')),
    );
  }
}
