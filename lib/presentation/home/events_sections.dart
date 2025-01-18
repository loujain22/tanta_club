import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tanta_club/components/event_card.dart';
import 'package:tanta_club/models/events_model.dart';
import 'package:tanta_club/providers/events_provider.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

import '../../navigation_menu.dart';

class EventsSection extends StatefulWidget {
  const EventsSection({super.key});

  @override
  State<EventsSection> createState() => _EventsSectionState();
}

class _EventsSectionState extends State<EventsSection> {
  @override
  void initState() {
    super.initState();
    // Fetch events when widget initializes
    Future.microtask(() =>
        Provider.of<EventsProvider>(context, listen: false).fetchEvents(context));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EventsProvider>(
      builder: (context, eventsProvider, child) {
        if (eventsProvider.isLoading) {
          return const Center(
              child: Padding(
            padding: EdgeInsets.all(20.0),
            child: CircularProgressIndicator(),
          ));
        }

        if (eventsProvider.error.isNotEmpty) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(eventsProvider.error),
          ));
        }

        if (eventsProvider.events.isEmpty) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(AppLocalizations.of(context)!.noEventsFound),
          ));
        }

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: isArabic() ? 20 : 5, left: isArabic() ? 5 : 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.events,
                    style: TTextTheme.textTheme.headlineSmall,
                  ),
                  InkWell(
                    onTap: () {
                      final controller = Get.find<NavigationController>();
                      controller.selectedIndex.value =
                          1; // Index 1 is for Events
                    },
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.viewAll,
                          style: TTextTheme.textTheme.bodyMedium,
                        ),
                        const Icon(Icons.arrow_right)
                      ],
                    ),
                  )
                ],
              ),
            ),
            // -- Carousel Events Section
            CarouselSlider(
              items: eventsProvider.events.map((event) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: EventsCard(
                    events: event,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 260,
                autoPlay: true,
              ),
            ),
          ],
        );
      },
    );
  }
}
