import 'package:flutter/material.dart';
import 'package:tanta_club/data/events_data.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/presentation/events/big_event.dart';
import 'package:tanta_club/presentation/events/small_event.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

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
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back)),
              const SizedBox(width: 110),
              Text(S.of(context)!.events,
                  style: TTextTheme.textTheme.titleLarge),
            ],
          ),
        ),

        const Padding(
          padding: EdgeInsets.only(top: 110, left: 10, right: 10),
          child: BigEventWidget(),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 390),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: eventsData.length,
              itemBuilder: (context, index) => SmallEvent(
                    event: eventsData[index],
                    // indexitem: index,
                  )),
        ),
      ],
    ));
  }
}
