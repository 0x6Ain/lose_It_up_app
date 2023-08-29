import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lose_it_up_app/constants/app_sizes.dart';
import 'package:lose_it_up_app/features/meals/data/meal_repository.dart';
import 'package:lose_it_up_app/localization/string_hardcoded.dart';

class MealListScreen extends ConsumerStatefulWidget {
  const MealListScreen({super.key});

  @override
  ConsumerState<MealListScreen> createState() => _MealListScreenState();
}

class _MealListScreenState extends ConsumerState<MealListScreen> {
  final _node = FocusScopeNode();
  final _searchController = TextEditingController();
  var currentPage = 1;

  @override
  void initState() {
    ref.read(mealRepositoryProvider).fetchData();
    super.initState();
  }

  @override
  void dispose() {
    _node.dispose();
    _searchController.dispose();
    super.dispose();
  }

  String get searchText => _searchController.text;

  void searchTextChange(String value) {
    ref.read(mealRepositoryProvider).searchData(query: _searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final mealListValues = ref.watch(mealStateChangesProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //make App bar text center
      appBar: AppBar(
        title: const Text(
          'Add meal',
          textAlign: TextAlign.center,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: mealListValues.maybeWhen(
            data: (meal) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: meal?.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 75,
                      child: Card(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    '${meal?[index].name}',
                                    style: Theme.of(context).textTheme.titleLarge,
                                    maxLines: 1,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '${meal?[index].calories} kcal',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  meal?[index].sampling_region.toString() ?? '',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const Spacer(),
                                Text('carbs'.hardcoded),
                                Text(' : '.hardcoded),
                                Text(
                                  meal?[index].carbs.toString() ?? '',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                gapW12,
                                Text('protein'.hardcoded),
                                Text(' : '.hardcoded),
                                Text(
                                  meal?[index].protein.toString() ?? '',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                gapW12,
                                Text('fat'.hardcoded),
                                Text(' : '.hardcoded),
                                Text(
                                  meal?[index].fat.toString() ?? '',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => const Center(child: Text('Noting to show'))),
      ),
    );
  }
}
