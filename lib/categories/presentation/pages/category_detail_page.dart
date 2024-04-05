import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/categories/domain/usecases/get_categories_details_use_case.dart';
import '/categories/presentation/widgets/item_talent_widget.dart';
import '/categories/presentation/widgets/loading_url_shortener_widget.dart';
import '/categories/presentation/widgets/retry_column.dart';
import '/categories/application/providers/providers.dart';

///Categories details page
class CategoryDetailsPage extends ConsumerStatefulWidget {
  ///Constructor
  const CategoryDetailsPage({
    Key? key,
    required this.url,
    required this.title,
    this.categoryImage,
  }) : super(key: key);

  final String url;
  final String title;
  final String? categoryImage;

  @override
  ConsumerState<CategoryDetailsPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoryDetailsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => getData(),
    );
  }

  /// Call notifier to fetch the data to display
  /// Get Categories details
  Future<void> getData() async {
    ref.read(categoryDetailsProvider.notifier).execute(
          params: GetCategoriesDetailsParams(widget.url),
        );
  }

  @override
  Widget build(BuildContext context) {
    final launchState = ref.watch(
      categoryDetailsProvider,
    );
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(widget.title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              CachedNetworkImage(
                imageUrl: widget.categoryImage ?? '',
                width: MediaQuery.of(context).size.width,
                height: 250,
                placeholder: (context, url) => const Padding(
                  padding: EdgeInsets.all(30),
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Expanded(
                child: launchState.maybeWhen(
                  error: (_) => Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.only(top: 30),
                    child: RetryColumnWidget(
                      onTap: () {
                      },
                    ),
                  ),
                  loading: () => SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: const LoadingCategoriesWidget(),
                  ),
                  data: (data) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.builder(
                        key: const Key('linkList'),
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final talent = data[index];
                          return ItemTalentWidget(talent: talent);
                        },
                      ),
                    );
                  },
                  orElse: () => const SizedBox(),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
