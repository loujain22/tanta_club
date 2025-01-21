import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanta_club/models/events_model.dart';
import 'package:tanta_club/models/event.dart';
import 'package:tanta_club/presentation/events/events_details.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/keys.dart';

class BigEventWidget extends StatelessWidget {
  final EventsModel event;

  const BigEventWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
        child: Stack(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(2),
                bottomLeft: Radius.circular(2),
                bottomRight: Radius.circular(2)),
            child: Image.network(
              '${ApiKeys.baseUrl}${event.eventImage}',
              headers: ApiKeys.getAuthImageHeaders(context),
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 300,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.error),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 300,
            alignment: isArabic() ? Alignment.bottomRight : Alignment.bottomLeft,
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
            child: Padding(
              padding: const EdgeInsets.only(top: 210),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.eventName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_pin,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 18),
                          const SizedBox(width: 6),
                          Text(
                            event.location,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.calendar_month,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 18),
                          const SizedBox(width: 6),
                          Text(
                            event.dataTime,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
