import 'package:add_to_card_provider/cart/add_to_offline.dart';
import 'package:add_to_card_provider/services/view/Todo_no_model.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customButton(
                  pageName: AddToCartOffline(),
                  context: context,
                  text: 'Add_to Cart Offline',
                ),
                customButton(
                  pageName: TodoApiScreenPage(),
                  context: context,
                  text: 'ToDo Page Online',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget customButton(
    {required String text,
    // required VoidCallback onTap,
    required BuildContext context,
    required Widget pageName}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        // log("Anand");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pageName),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.teal, borderRadius: BorderRadius.circular(40)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.black),
        )),
      ),
    ),
  );
}
