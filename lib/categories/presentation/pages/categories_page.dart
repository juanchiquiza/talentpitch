import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/categories/presentation/widgets/loading_url_shortener_widget.dart';
import '/categories/domain/entities/category.dart';
import '/categories/presentation/widgets/item_widget.dart';
import '/categories/presentation/widgets/retry_column.dart';
import '/categories/domain/usecases/get_categories_use_case.dart';
import '/categories/application/providers/providers.dart';

///categories page
class CategoriesPage extends ConsumerStatefulWidget {
  ///Constructor
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  late String url;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => getData(),
    );
  }

  /// Call notifier to fetch the data to display
  /// Get Categories
  Future<void> getData() async {
    ref.read(categoriesProvider.notifier).execute(
      params: GetCategoriesParams(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final launchState = ref.watch(
      categoriesProvider,
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
        child: SingleChildScrollView(
          child: SizedBox(
            child: RefreshIndicator(
              onRefresh: getData,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          height: 35,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 5),
                            ],
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            onChanged: (value) {
                              url = value;
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 5),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            getData(url);
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            size: 33.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),*/
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text('Categorias',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  launchState.maybeWhen(
                    error: (_) => Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: const EdgeInsets.only(top: 30),
                      child: RetryColumnWidget(
                        onTap: () {
                          //  getData(url);
                        },
                      ),
                    ),
                    loading: () => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: const LoadingUrlShortenerWidget(),
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
                            final category = data[index];
                            return ItemWidget(category: category);
                          },
                        ),
                      );
                    },
                    orElse: () => const SizedBox(),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  /*  SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    key: const Key('linkList'),
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemCount: arrayLinks.length,
                    itemBuilder: (context, index) {
                      final link = arrayLinks[index];
                      return ItemWidget(link: link);
                    },
                  ),
                ),*/
                ],
              ),
            ),


          ),
        ),
      ),
    );
  }
}