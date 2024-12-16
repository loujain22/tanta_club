import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tanta_club/components/event_card.dart';
import 'package:tanta_club/data/events_data.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/models/event.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class EventsSection extends StatelessWidget {
  const EventsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Event event;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: isArabic() ? 20 : 5, left: isArabic() ? 5 : 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).events,
                style: TTextTheme.textTheme.headlineSmall,
              ),
              Row(
                children: [
                  Text(
                    S.of(context).viewAll,
                    style: TTextTheme.textTheme.bodyMedium,
                  ),
                  const Icon(Icons.arrow_right)
                ],
              )
            ],
          ),
        ),
        // -- Carousel Events Section
        CarouselSlider(
            items: eventsData.map((i) {
              return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  // margin: const EdgeInsets.symmetric(horizontal: 1),
                  child: EventsCard(events: i));
            }).toList(),
            options: CarouselOptions(
              height: 260,
              autoPlay: true,
              //enlargeCenterPage: true,
              //enlargeFactor: 0.3
            )),
      ],
    );
  }
}
