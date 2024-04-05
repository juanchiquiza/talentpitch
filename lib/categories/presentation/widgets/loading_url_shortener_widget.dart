import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import '/core/presentation/styles/colors_app.dart';
import '/core/presentation/styles/shadow_styles.dart';

/// Loading Link list
class LoadingUrlShortenerWidget extends StatelessWidget {
  /// Constructor
  const LoadingUrlShortenerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade300,
        child: ListView.builder(
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 10,
                  width: 150,
                  margin: const EdgeInsets.only(right: 12, left: 4),
                  decoration: BoxDecoration(
                    color: ColorsApp.white,
                    boxShadow: cardShadow,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 10,
                  width: 130,
                  margin: const EdgeInsets.only(right: 12, left: 4),
                  decoration: BoxDecoration(
                    color: ColorsApp.white,
                    boxShadow: cardShadow,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
