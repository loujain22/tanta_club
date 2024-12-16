import 'package:flutter/material.dart';
import 'package:tanta_club/models/news.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 7,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.asset(
                news.newImg,
                height: 150,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  news.title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 60, 60, 60),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Color.fromARGB(255, 184, 184, 184),
                      size: 16,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      news.date,
                      style: TextStyle(
                          fontSize: 10, color: Colors.black.withOpacity(0.5)),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
