import 'package:flutter/material.dart';
import 'package:lasi/data.dart';
import 'package:lasi/info.dart';
import 'package:lasi/item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          title: const Column(
            children: [
              Text(
                "ＬＡＳＩ",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SearchBar(),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.add),
        //   onPressed: () {},
        // ),
        body: ListView.builder(
          itemCount: shopsList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Info(index: index),
                  ),
                );
              },
              child: Items(
                item: shopsList[index],
                index: index,
              ),
            );
          },
        ));
  }
}
