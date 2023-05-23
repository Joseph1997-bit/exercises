import 'package:exercises/models/exercises_model.dart';
import 'package:exercises/view/screens/choose_type_screen.dart';
import 'package:get/get.dart';

import '../../services/getAllExerciseService.dart';
import '../../view/screens/home_screen.dart';

class ExerciseController extends GetxController {
  var newExercise = <ExercisesModel>[].obs;
  var isLoading = true.obs; //isLoading true ise yani bilgi getirliyo o Zaman ekranda  kucuk bi bekleme dairesi gozuksun bilgi gelene kadar

  getExercise({var muscle, var type,var name}) async {
    try {
      isLoading.value = true;
    return  newExercise.value = await GetAllExerciseService()
          .getAllExercises(muscle: muscle, type: type,name: name);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getExercises();
  }

  getExercises() async {
    try {
      isLoading.value = true;
      return  newExercise.value =
        await GetAllExerciseService().getAllExercises(muscle: '', type: '');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshExerciseList() async {
   /* final List<ExercisesModel> exercises =
    await getExercises();*/
    filteredExerciseList.value = [];
    searchLoading.value = false;
    try {
      isLoading.value = true;
        newExercise.value =
      await GetAllExerciseService().getAllExercises(muscle: '', type: '');
      selectedType='';
      selectedMuscle='';
    } finally {
      isLoading.value = false;
    }
  }
}
