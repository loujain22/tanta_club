import 'package:flutter/material.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';

class BigEventWidget extends StatelessWidget {
  const BigEventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 7,
      margin: const EdgeInsets.all(10),
      child: Stack(children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
              bottomLeft: Radius.circular(2),
              bottomRight: Radius.circular(2)),
          child: Image.asset("assets/images/boxEvent.jpg",
              height: 300, width: double.infinity, fit: BoxFit.cover),
        ),
        Container(
          height: 300,
          alignment: isArabic() ? Alignment.bottomRight : Alignment.bottomLeft,
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
          child: Padding(
            padding: const EdgeInsets.only(top: 210),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("كيف تكون الملاكمة مفيدة لك؟",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    overflow: TextOverflow.fade),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_pin,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 18),
                        const SizedBox(width: 6),
                        Text(
                          S.of(context)!.tantaclub,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(Icons.calendar_month,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 18),
                        SizedBox(width: 6),
                        Text("2024/12/12 10:00 م",
                            style: TextStyle(color: Colors.white, fontSize: 12))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
