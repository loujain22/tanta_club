import 'package:flutter/material.dart';
import 'package:tanta_club/models/news.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';

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
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 150,
              alignment:
                  isArabic() ? Alignment.bottomRight : Alignment.bottomLeft,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.8),
                  ],
                      stops: const [
                    0.6,
                    1
                  ])),
              child: Text(
                news.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                //overflow: TextOverflow.fade,
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  color: Color.fromARGB(255, 184, 184, 184),
                  size: 20,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  news.date,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
