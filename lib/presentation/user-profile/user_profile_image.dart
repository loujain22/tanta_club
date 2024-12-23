import 'package:flutter/material.dart';
import 'package:tanta_club/style/colors.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 140,
          right: isArabic() ? 135 : 0,
          left: isArabic() ? 0 : 135,
          bottom: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(1), // Border width
            decoration: const BoxDecoration(
                color: Color(0xFFABACAF), shape: BoxShape.circle),
            child: ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(70), // Image radius
                child: Image.asset('assets/images/profile-img.png',
                    fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "أحمد ضرار",
            style: TextStyle(
                color: TColors.userProfileTextColor,
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
