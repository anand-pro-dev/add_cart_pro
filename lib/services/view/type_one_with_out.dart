// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../provider/pro_provider.dart';

class TodoNoModel extends StatefulWidget {
  TodoNoModel({Key? key}) : super(key: key);

  @override
  _TodoNoModelState createState() => _TodoNoModelState();
}

List<CustomModel> postList = [];

class _TodoNoModelState extends State<TodoNoModel> {
  //
  Future<List<CustomModel>> getApiWithoutModel() async {
    final respone =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    var data = jsonDecode(respone.body.toString());
    if (respone.statusCode == 200) {
      log(data.toString());
      for (Map<String, dynamic> i in data) {
        CustomModel model = CustomModel(
          title: i['title'],
          task: i['completed'],
        );
        postList.add(model);
      }
      return postList;
    } else {
      log("opps");
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder<List<CustomModel>>(
        future: getApiWithoutModel(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // until data is fetched, show loader
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            // once data is fetched, display it on screen (call buildPosts())
            final getSnap = snapshot.data!;
            return getDataWidget(getSnap);
          } else {
            // if no data, show simple Text
            return const Text("No data available");
          }
        },
      ),
    ));
  }
}

Widget getDataWidget(List<CustomModel> getSnap) {
  return ListView.builder(
    itemCount: getSnap.length,
    shrinkWrap: true,
    physics: const ScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {
      final circleAvatarProvider = Provider.of<CircleAvatarProvider>(context);
      final taskStatusProvider = Provider.of<LikeDislikeProvider>(context);
      final getLiked = getSnap[index]
          .task; // Get the isLike status from the filteredTickets list
      bool isLiked = taskStatusProvider.isLiked(index, getLiked!);
      return ListTile(
        leading: CircleAvatar(
          backgroundColor: circleAvatarProvider.isIndexSelected(index)
              ? Colors.red
              : Colors.blue,
          child: IconButton(
            icon: Icon(Icons.touch_app),
            onPressed: () {
              circleAvatarProvider.toggleSelection(index);
            },
          ),
        ),
        title: Text(getSnap[index].title.toString()),
        subtitle: Text(getSnap[index].task.toString()),
        trailing: IconButton(
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked == true ? Colors.red : Colors.amber,
          ),
          onPressed: () {
            //
            taskStatusProvider.toggleLike(index, getLiked);
            //
          },
        ),
      );
    },
  );
}

class CustomModel {
  String title;
  bool task;
  CustomModel({
    required this.task,
    required this.title,
  });
}




      //  IconButton(
      //                                     icon: Icon(
      //                                       isLiked
      //                                           ? Icons.favorite
      //                                           : Icons.favorite_border,
      //                                       color: isLiked == true
      //                                           ? AppColors.redColor
      //                                           : iconColor,
      //                                     ),
      //                                     onPressed: () {
      //                                       //
/*  very similar to like use for comment */
      //                                       //
      //                                       if (isLiked == true) {
      //                                         commentCounterProvider
      //                                             .decrementCommentCount(index);
      //                                       } else {
      //                                         commentCounterProvider
      //                                             .incrementCommentCount(index);
      //                                       }

      //                                       // setState(() {});
      //                                     },
      //                                   ),
