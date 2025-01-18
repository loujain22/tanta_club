import 'package:flutter/material.dart';
import 'package:tanta_club/models/sport_model.dart';
import 'package:tanta_club/utils/keys.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class SportsDetails extends StatelessWidget {
  final SportModel sport;

  const SportsDetails({super.key, required this.sport});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sport.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sport Image
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    '${ApiKeys.baseUrl}${sport.image}',
                    headers: ApiKeys.getAuthImageHeaders(context),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sport Title
                  Text(
                    sport.title,
                    style: TTextTheme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),

                  // Sport Description
                  Text(
                    sport.description,
                    style: TTextTheme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),

                  // Additional Sport Information
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              backgroundImage: NetworkImage(
                                '${ApiKeys.baseUrl}${sport.icon}',
                                headers: ApiKeys.getAuthImageHeaders(context),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              sport.sportName,
                              style: TTextTheme.textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Text(
                        //   'Status: ${sport.isActive ? "Active" : "Inactive"}',
                        //   style: TTextTheme.textTheme.bodyMedium,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
