import 'package:flutter/material.dart';
import 'package:tanta_club/models/event.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';

class SmallEvent extends StatelessWidget {
  const SmallEvent({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 100,
              child: Padding(
                padding: EdgeInsets.only(
                    left: isArabic() ? 0 : 10,
                    right: isArabic() ? 10 : 0,
                    top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month,
                            color: Color(0xFF393939), size: 18),
                        const SizedBox(width: 6),
                        Text(
                          event.date,
                          style: const TextStyle(
                              color: Color(0xFF393939), fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.location_pin,
                            color: Color(0xFF393939), size: 18),
                        const SizedBox(width: 6),
                        Text(
                          event.place,
                          style: const TextStyle(
                              color: Color(0xFF393939), fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: isArabic()
                    ? const Radius.circular(10)
                    : const Radius.circular(0),
                topRight: isArabic()
                    ? const Radius.circular(0)
                    : const Radius.circular(10),
                bottomLeft: isArabic()
                    ? const Radius.circular(10)
                    : const Radius.circular(0),
                bottomRight: isArabic()
                    ? const Radius.circular(0)
                    : const Radius.circular(10),
              ),
              child: Image.asset(event.img,
                  height: 100, width: 140, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
