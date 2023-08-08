import 'dart:developer';

import 'package:flutter/material.dart';

class MyAppdd extends StatelessWidget {
  final List<Map<String, dynamic>> apiResponse = [
    {
      "userId": 10,
      "id": 199,
      "title": "numquam repellendus a magnam",
      "completed": true
    },
    {
      "userId": 10,
      "id": 200,
      "title": "ipsam aperiam voluptates qui",
      "completed": false
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('API Response')),
        body: ListView.builder(
          itemCount: apiResponse.length,
          itemBuilder: (context, index) {
            final item = apiResponse[index];
            bool isCompleted = item['completed'];

            return GestureDetector(
              onTap: () {
                // Toggle the value of completed
                isCompleted = !isCompleted;
                // Update the API response
                log("ok");
                apiResponse[index]['completed'] = isCompleted;
              },
              child: Container(
                color: isCompleted ? Colors.red : Colors.yellow,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['title']),
                    SizedBox(height: 8),
                    Container(
                      color: isCompleted ? Colors.blue : Colors.grey,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        isCompleted ? 'Mark Incomplete' : 'Mark Complete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
