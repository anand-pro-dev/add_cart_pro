import 'dart:developer';
import 'package:add_to_card_provider/provider/pro_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddedCartPageOffIndex extends StatelessWidget {
  const AddedCartPageOffIndex({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    log("I m Re-Build Cart Page ");
    // final cartProvider = Provider.of<AddtoCartOffine>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Consumer<AddtoCartOffine>(
                builder: (contex, addCartProvider, child) {
              return ListView.builder(
                  itemCount: addCartProvider.addItem.length,
                  itemBuilder: (context, index) {
                    log("Cart Consumer");
                    final words = addCartProvider.addItem;
                    final wordPro = words[index];
                    return ListTile(
                      title: Text("  $wordPro"),
                      subtitle: Text("  $words"),
                      trailing: IconButton(
                        onPressed: () {
                          addCartProvider.toggleAdd(wordPro);
                        },
                        icon: addCartProvider.isExisted(wordPro)
                            ? const Icon(Icons.dangerous)
                            : const Icon(Icons.addchart),
                        color: addCartProvider.isExisted(wordPro)
                            ? Colors.redAccent
                            : Colors.blue,
                      ),
                    );
                  });
            }),
          ),
        ],
      ),
    );
  }
}
