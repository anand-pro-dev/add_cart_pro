// import 'dart:convert';
// import 'package:add_to_card_provider/services/models/todo_model.dart';
// import 'package:http/http.dart' as http;

// class ApiServices {
//   Future <List<Todo>> getTodo
//   var client = http.Client();
//   String endpoint = 'https://jsonplaceholder.typicode.com/todos';
//   Future<TodoApiModel> getUsers() async {
//     final response = await http.get(Uri.parse(endpoint));
//     if (response.statusCode == 200) {
//       var result = jsonDecode(response.body);
//       return TodoApiModel.fromJson(result);
//     } else {
//       throw Exception(response.reasonPhrase);
//     }
//   }
// }


// // class ApiServices {
// //   var client = http.Client();
// //   String endpoint = 'https://jsonplaceholder.typicode.com/todos';
// //   Future<TodoApiModel> getUsers() async {
// //     final response = await http.get(Uri.parse(endpoint));
// //     if (response.statusCode == 200) {
// //       var result = jsonDecode(response.body);
// //       return TodoApiModel.fromJson(result);
// //     } else {
// //       throw Exception(response.reasonPhrase);
// //     }
// //   }
// // }
