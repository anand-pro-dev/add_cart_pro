// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TypeApiOneWithOutModel extends StatefulWidget {
  TypeApiOneWithOutModel({Key? key}) : super(key: key);

  @override
  _TypeApiOneWithOutModelState createState() => _TypeApiOneWithOutModelState();
}

List<CustomModel> postList = [];

class _TypeApiOneWithOutModelState extends State<TypeApiOneWithOutModel> {
  //
  Future<List<CustomModel>> getApiWithoutModel() async {
    final respone =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(respone.body.toString());
    if (respone.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        CustomModel model = CustomModel(
          body: i['body'],
          title: i['title'],
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
        body: FutureBuilder(
      future: getApiWithoutModel(),
      builder: (context, AsyncSnapshot<List<CustomModel>> snapshot) {
        if (!snapshot.hasData) {
          return Text("No data found");
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(2),
                child: Text(snapshot.data![index].body.toString()),
              );
            },
          );
        }
      },
    ));
  }
}

class CustomModel {
  String title, body;
  CustomModel({
    required this.body,
    required this.title,
  });
}
