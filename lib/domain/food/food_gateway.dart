import 'food.dart';

abstract class FoodGateway {
  Future<List<Food>> getFood();
  Future<Food> getDetailFood();
}
