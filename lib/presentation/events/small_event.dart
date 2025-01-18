import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanta_club/models/events_model.dart';
import 'package:tanta_club/models/event.dart';
import 'package:tanta_club/presentation/events/events_details.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/keys.dart';

class SmallEvent extends StatelessWidget {
  const SmallEvent({super.key, required this.event});

  final EventsModel event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
        onTap: () {
          final eventDetails = Event(
            id: 0,
            title: event.eventName,
            place: event.location,
            date: event.dataTime,
            img: '${ApiKeys.baseUrl}${event.eventImage}',
            description: event.eventInfo,
          );
          Get.to(() => EventsDetailsScreen(event: eventDetails));
        },
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
                        event.eventName,
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
                            event.dataTime,
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
                            event.location,
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
                child: Image.network(
                  '${ApiKeys.baseUrl}${event.eventImage}',
                  headers: ApiKeys.getAuthImageHeaders(context),
                  height: 100,
                  width: 140,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 100,
                      width: 140,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.error),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
