

import 'package:exercises/logic/controllers/exercise_controller.dart';
import 'package:get/get.dart';

class ExerciseBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(
        ExerciseController()
    );
  }
}
