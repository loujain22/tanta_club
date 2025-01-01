import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/event_card.dart';
import '../../providers/events_provider.dart';
import '../../models/events_model.dart';
import '../../generated/l10n.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/theme/custom_themes/text_theme.dart';

class EventsSection extends StatefulWidget {
  const EventsSection({Key? key}) : super(key: key);

  @override
  State<EventsSection> createState() => _EventsSectionState();
}

class _EventsSectionState extends State<EventsSection> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<EventsProvider>().fetchEvents());
  }

  void _navigateToAllEvents() {
    // TODO: Implement navigation to all events screen
    debugPrint('Navigating to all events screen');
  }

  void _navigateToEventDetails(EventsModel event) {
    // TODO: Implement navigation to event details screen
    debugPrint('Navigating to event details: ${event.title}');
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
            ),
          );
        }

        if (eventsProvider.error.isNotEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    eventsProvider.error,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => eventsProvider.fetchEvents(),
                    child: Text(S.of(context)!.tryAgain),
                  ),
                ],
              ),
            ),
          );
        }

        final events = eventsProvider.events;

        if (events.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                S.of(context)!.noEventsFound,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          );
        }

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: isArabic() ? 20 : 5,
                left: isArabic() ? 5 : 20,
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).upcomingEvents,
                    style: TTextTheme.textTheme.headlineSmall,
                  ),
                  TextButton(
                    onPressed: _navigateToAllEvents,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          S.of(context).viewAllEvents,
                          style: TTextTheme.textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Icon(
                          isArabic() ? Icons.arrow_left : Icons.arrow_right,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 280,
                viewportFraction: 0.85,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: events.map((event) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: EventsCard(
                    events: event,
                    onTap: () => _navigateToEventDetails(event),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (events.length > 1) ...[
                  IconButton(
                    onPressed: () {
                      _carouselController.previousPage();
                    },
                    icon: Icon(
                      isArabic()
                          ? Icons.arrow_forward_ios
                          : Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                  ...List.generate(events.length, (index) {
                    return Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            Theme.of(context).colorScheme.primary.withOpacity(
                                  _currentIndex == index ? 0.9 : 0.4,
                                ),
                      ),
                    );
                  }),
                  IconButton(
                    onPressed: () {
                      _carouselController.nextPage();
                    },
                    icon: Icon(
                      isArabic()
                          ? Icons.arrow_back_ios
                          : Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                ],
              ],
            ),
          ],
        );
      },
    );
  }
}
