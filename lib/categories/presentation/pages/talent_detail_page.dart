import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/categories/domain/entities/talent.dart';

///Talent Detail Page
class TalentDetailPage extends ConsumerStatefulWidget {
  ///Constructor
  const TalentDetailPage({
    Key? key,
    required this.talent,
  }) : super(key: key);

  final Talent talent;

  @override
  ConsumerState<TalentDetailPage> createState() => _TalentDetailPageState();
}

class _TalentDetailPageState extends ConsumerState<TalentDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Talent pitch'),
        leading: Container(
          margin: const EdgeInsets.only(
            left: 12,
            top: 14,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios, size: 18),
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: widget.talent.avatar,
                width: MediaQuery.of(context).size.width,
                height: 250,
                placeholder: (context, url) => const Padding(
                  padding: EdgeInsets.all(30),
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(widget.talent.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(widget.talent.city,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
