import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  final Map<String, Object> item;
  final int index;
  const Items({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 5),
              blurRadius: 3,
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  8,
                ),
              ),
              child: Hero(
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
            ),
            Text(
              item['name'] as String,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Text(
            //   item['discription']!,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on),
                Text(
                  item['location'] as String,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
