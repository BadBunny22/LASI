import 'package:flutter/material.dart';
import 'package:lasi/data.dart';

class Info extends StatelessWidget {
  final int index;
  const Info({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ＬＡＳＩ",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: "$index",
              child: Image.asset(
                "assets/$index.jpg",
                fit: BoxFit.fitWidth,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/placeholder.png",
                    fit: BoxFit.fitWidth,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              shopsList[index]["name"] as String,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Items:",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/2,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                ),
                itemCount: (shopsList[index]["items"] as List).length,
                itemBuilder: (context, nm) {
                  var item = (shopsList[index]["items"] as List);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 5),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${item[nm][0]}",
                            style: const TextStyle(
                              fontSize: 28,
                            ),
                          ),
                          Text("Price: ৳${item[index][1]}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Icon(Icons.location_on),
            //     Text(
            //       shopsList[index]['location'] as String,
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
          ],
        ),
      ),
    );
  }
}
