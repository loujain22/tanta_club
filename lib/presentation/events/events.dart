import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tanta_club/presentation/events/big_event.dart';
import 'package:tanta_club/presentation/events/small_event.dart';
import 'package:tanta_club/providers/events_provider.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

import '../../navigation_menu.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<EventsProvider>(context, listen: false)
        .fetchEvents(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
            child: isArabic()
                ? Image.asset("assets/images/arEventHeader.png")
                : Image.asset("assets/images/enEventHeader.png")),

        // -- Page Header
        Padding(
          padding: EdgeInsets.only(
              top: 50, left: isArabic() ? 0 : 20, right: isArabic() ? 20 : 0),
          child: Row(
            children: [
              IconButton.outlined(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                        width: 1.0, color: Color.fromARGB(255, 7, 7, 7)),
                  ),
                  onPressed: () =>
                      Get.find<NavigationController>().selectedIndex.value = 0,
                  icon: const Icon(Icons.arrow_back)),
              const SizedBox(width: 110),
              Text(AppLocalizations.of(context)!.events,
                  style: TTextTheme.textTheme.titleLarge),
            ],
          ),
        ),

        Consumer<EventsProvider>(
          builder: (context, eventsProvider, child) {
            if (eventsProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (eventsProvider.error.isNotEmpty) {
              return Center(child: Text(eventsProvider.error));
            }

            final featuredEvent = eventsProvider.featuredEvent;
            final regularEvents = eventsProvider.regularEvents;

            return Stack(
              children: [
                if (featuredEvent != null)
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 110, left: 10, right: 10),
                    child: BigEventWidget(event: featuredEvent),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 390),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: regularEvents.length,
                    itemBuilder: (context, index) => SmallEvent(
                      event: regularEvents[index],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    ));
  }
}
