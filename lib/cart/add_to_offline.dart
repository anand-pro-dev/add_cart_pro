import 'dart:developer';

import 'package:add_to_card_provider/cart/added_page.dart';
import 'package:add_to_card_provider/provider/pro_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';

class AddToCartOffline extends StatelessWidget {
  const AddToCartOffline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    log("I m Re-Build");
    final words = nouns.take(10).toList();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add to card with Provider"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Consumer<CounterProvider>(
                builder: (context, counterProvider, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(counterProvider.count.toString()),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          log("inc");
                          counterProvider.increment();
                        },
                        child: const Text("+"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          log("dec");
                          counterProvider.decrement();
                        },
                        child: const Text("-"),
                      ),
                    ],
                  );
                },
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final wordPro = words[index];
                      return Consumer<AddtoCartOffine>(
                          builder: (contex, addCartProvider, child) {
                        return ListTile(
                          title: Text("  $wordPro"),
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
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const AddedCartPageOffIndex()));
          },
          child: const Text("  Cart_Items  "),
        ),
      ),
    );
  }
}
