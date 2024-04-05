import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/categories/presentation/pages/talent_detail_page.dart';
import '/categories/presentation/pages/talent_video_page.dart';
import '/categories/domain/entities/talent.dart';

/// Item List for Categories
class ItemTalentWidget extends StatelessWidget {
  /// Constructor
  const ItemTalentWidget({
    Key? key,
    required this.talent,
  }) : super(key: key);

  final Talent talent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => talent.video.isNotEmpty
                  ? TalentVideoPage(urlVideo: talent.video)
                  : TalentDetailPage(talent: talent),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: talent.avatar,
                  width: 80,
                  height: 80,
                  placeholder: (context, url) => const Padding(
                    padding: EdgeInsets.all(30),
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        talent.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        talent.city,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
