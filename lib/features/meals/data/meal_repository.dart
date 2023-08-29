import 'dart:async';

import 'package:dio/dio.dart';
import 'package:lose_it_up_app/dummy/in_memory_store.dart';
import 'package:lose_it_up_app/features/meals/domain/meal.dart';
import 'package:lose_it_up_app/utils/http_service/http_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meal_repository.g.dart';

class MealRepository {
  MealRepository(this._httpService, {this.isDelay = true});
  final bool isDelay;
  final HttpService _httpService;
  var pageIndex = 1;

  final StreamController<List<Meal>?> _streamController = StreamController.broadcast();
  Stream<List<Meal>?> get stream => _streamController.stream;

  Future<void> fetchData({int page = 1}) async {
    pageIndex = page;
    final result = await _httpService.sendRequest(
        url: 'http://10.0.2.2:3000/meals',
        httpMethod: HttpMethod.get,
        responseType: ResponseType.json,
        queryParameters: {'page': pageIndex});
    List data = result.data;
    List<Meal> mealList = data.map((e) => Meal.fromJson(e)).toList();
    _streamController.add(mealList);
  }

  Future<void> searchData({String query = ''}) async {
    final result = await _httpService.sendRequest(
        url: 'http://10.0.2.2:3000/meals/search',
        httpMethod: HttpMethod.get,
        responseType: ResponseType.json,
        queryParameters: {'query': query});
    List data = result.data;
    List<Meal> mealList = data.map((e) => Meal.fromJson(e)).toList();

    _streamController.add(mealList);
  }

  // Stream<List<Meal>> watchData() {
  //   return _list.stream.map()
  // }
}

@riverpod
MealRepository mealRepository(MealRepositoryRef ref) {
  return MealRepository(ref.read(httpServiceProvider.notifier));
}

@riverpod
Stream<List<Meal>?> mealStateChanges(MealStateChangesRef ref) {
  final mealRepository = ref.watch(mealRepositoryProvider);
  return mealRepository.stream;
}
