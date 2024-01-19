import 'package:FoodieSathia/data/data.dart';

class HomeRepository {
  
  List<FoodRepo> getFoodList() {
    return FoodRepo.foodrepo;
  }
}
