import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanta_club/providers/user_provider.dart';
import 'package:tanta_club/style/colors.dart';
import 'package:tanta_club/utils/keys.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        if (userProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (userProvider.error.isNotEmpty) {
          return Center(child: Text(userProvider.error));
        }

        final user = userProvider.user;
        if (user == null) {
          return const Center(child: Text('No user data available'));
        }

        return Padding(
          padding: const EdgeInsets.only(top: 140, bottom: 10),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(1), // Border width
                  decoration: const BoxDecoration(
                      color: Color(0xFFABACAF), shape: BoxShape.circle),
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(70), // Image radius
                      child: user.image.isNotEmpty
                          ? Image.network(
                              '${ApiKeys.baseUrl}${user.image}',
                              headers: ApiKeys.getAuthImageHeaders(context),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/profile-img.png',
                                  fit: BoxFit.cover,
                                );
                              },
                            )
                          : Image.asset(
                              'assets/images/profile-img.png',
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  user.memberName,
                  style: const TextStyle(
                      color: TColors.userProfileTextColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
