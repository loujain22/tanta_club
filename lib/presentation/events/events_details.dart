import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tanta_club/models/event.dart';
import 'package:tanta_club/style/colors.dart';
import 'package:tanta_club/utils/keys.dart';

class EventsDetailsScreen extends StatelessWidget {
  const EventsDetailsScreen({super.key, required this.event});
  final Event event;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.eventDetails,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: "Almarai",
          ),
        ),
        leading: IconButton.outlined(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                  width: 1.0, color: Color.fromARGB(255, 7, 7, 7)),
            ),
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        shape: const RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: const TextStyle(fontSize: 26, fontFamily: "Almarai"),
                  maxLines: 2, // Limit to 2 lines
                  overflow: TextOverflow.ellipsis, // Add ".
                ),
                const SizedBox(height: 10),
                Text(
                  "${AppLocalizations.of(context)!.place}: ${event.place}",
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "Almarai",
                      color: TColors.secondary),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month,
                            color: TColors.secondary),
                        Text(
                          event.date,
                          style: const TextStyle(color: TColors.secondary),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month,
                            color: TColors.secondary),
                        Text(
                          event.date,
                          style: const TextStyle(color: TColors.secondary),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          Image.network(
            event.img,
            width: screenWidth,
            fit: BoxFit.cover,
            height: 350,
            headers: ApiKeys.getAuthImageHeaders(context),
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 350,
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.error),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              event.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                height: 1.8,
                fontSize: 16,
                fontFamily: "Almarai",
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
