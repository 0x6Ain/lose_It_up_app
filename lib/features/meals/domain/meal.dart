import 'package:freezed_annotation/freezed_annotation.dart';
part 'meal.g.dart';
part 'meal.freezed.dart';

@freezed
class Meal with _$Meal {
  factory Meal({
    required String id,
    required int number,
    required String name, //식품이름
    String? maker, //제조사명
    String? sampling_region,
    double? serving_size, //총내용량
    double? calories, //열량(kcal)
    double? carbs, //탄수화물(g)
    double? protein, //단백질(g)
    double? fat, //지방(g)
    double? sugars, //당류(g)
    double? natrium, //나트륨(mg)
    double? cholesterol, //콜레스테롤(mg)
    double? saturated_fat, //포화지방산(g)
    double? transfat,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}
