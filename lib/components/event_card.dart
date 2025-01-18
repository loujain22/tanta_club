import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/events_model.dart';
import '../presentation/events/events_details.dart';
import '../models/event.dart';
import '../utils/helpers/helper_functions.dart';
import '../utils/keys.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({
    super.key, 
    required this.events,
    this.onPressed,
  });

  final EventsModel events;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Convert EventsModel to Event for details screen
        final event = Event(
          id: 0, // You might want to add id to your EventsModel
          title: events.eventName,
          place: events.location,
          date: events.dataTime,
          img: '${ApiKeys.baseUrl}${events.eventImage}',
          description: events.eventInfo,
        );
        Get.to(() => EventsDetailsScreen(event: event));
      },
      child: Card(
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
                child: Image.network(
                  '${ApiKeys.baseUrl}${events.eventImage}',
                  headers: ApiKeys.getAuthImageHeaders(context),
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 150,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.error),
                      ),
                    );
                  },
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
                  events.eventName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  overflow: TextOverflow.fade,
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: Colors.amber,
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          events.location,
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: Colors.amber,
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          events.dataTime,
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
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
