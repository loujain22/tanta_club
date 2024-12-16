import 'package:flutter/material.dart';
import 'package:tanta_club/models/news.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({super.key, required this.news});

  final News news;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 315,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Image.asset(news.newImg,
                    height: 220, width: double.infinity, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.only(
                  left: isArabic() ? 0 : 15, right: isArabic() ? 15 : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        color: Colors.black,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(news.date,
                          style: const TextStyle(
                              fontSize: 10, color: Colors.black)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
