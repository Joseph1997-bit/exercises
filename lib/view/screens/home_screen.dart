import 'package:exercises/models/exercises_model.dart';
import 'package:exercises/view/widgets/text_field_widget.dart';
import 'package:exercises/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../logic/controllers/exercise_controller.dart';
import 'choose_type_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var searchLoading = false.obs;
var filteredExerciseList = <ExercisesModel>[].obs;

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldDrawer = GlobalKey<ScaffoldState>();
  final controller = Get.put(ExerciseController());
  Rx<TextEditingController> searchTextController = TextEditingController().obs;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  late List<ExercisesModel> exercise;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        key: scaffoldDrawer,
        endDrawer: SafeArea(
          child: Drawer(
            child: ChooseTypeAndMuscle(),
          ),
        ),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          //appbar ve body renkleri ayni yapmak icin transparent kullaniyoz
          title: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: TextField(
              controller: searchTextController.value,
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              onChanged: (searchName) async {
                List<ExercisesModel> exerciseList =
                    await controller.getExercise(name: searchName,type: selectedType,muscle: selectedMuscle);
                /* List<ExercisesModel> exerciseList = await GetAllExerciseService()
                  .getAllExercises(type: selectedType, muscle: selectedMuscle);
              List<ExercisesModel> searchList = exerciseList.where((element) {
                return element.name.contains(searchName);
              }).toList();*/
                if (searchName.isNotEmpty) {
                  searchLoading.value = true;
                } else {
                  searchLoading.value = false;

                }

                setState(() {
                  //TextFiled Obx icinde olmadigi icin setState kullanmamiz gerekiyo
                  filteredExerciseList.value = exerciseList;
                });
                print(filteredExerciseList[0].name);
              },
              decoration: inputDecoration.copyWith(
                suffixIcon: searchTextController.value.text.isNotEmpty
                    ? IconButton(
                        onPressed: () async {
                          setState(() {
                            searchTextController.value.clear();
                          });
                          FocusScope.of(context).unfocus();
                          final List<ExercisesModel> refresh =
                              await controller.getExercises();
                          filteredExerciseList.value = [];//searchListeyi temizlemezsek son aradigmiz seyi gosterir
                          searchLoading.value = false;
                            try {
                              controller.isLoading.value = true;
                              controller.newExercise.value = refresh;
                              selectedType='';
                              selectedMuscle='';
                            } finally {
                              controller.isLoading.value = false;
                            }



                        },
                        icon: const Icon(Icons.close),
                      )
                    : const Icon(Icons.search),
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0, right: 8.0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    scaffoldDrawer.currentState?.openEndDrawer();
                  },
                  icon: const Icon(Bootstrap.sliders, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white70.withOpacity(0.8),
        body: Obx(() {
          if (controller.isLoading.isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              onRefresh: controller.refreshExerciseList,
              key: _refreshIndicatorKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 13.0, bottom: 15.0),
                      child: Text(
                        '${filteredExerciseList.isNotEmpty || searchLoading.isTrue ? filteredExerciseList.length : controller.newExercise.length} results found.',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Expanded(
                        child: ListView.separated(
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            itemBuilder: (context, index) {
                              return Container(
                                  height: 120.0,
                                  width: 100.0,
                                  alignment: Alignment.topLeft,
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 10.0),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          filteredExerciseList.isNotEmpty ||
                                                  searchLoading.isTrue
                                              ? filteredExerciseList[index].name
                                              : controller
                                                  .newExercise[index].name,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0)),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, bottom: 15.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              height: 30,
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8.0,
                                              ),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15))),
                                              child: Text(filteredExerciseList
                                                          .isNotEmpty ||
                                                      searchLoading.isTrue
                                                  ? filteredExerciseList[index]
                                                      .type
                                                  : controller
                                                      .newExercise[index].type),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: TextUtils(
                                          text:
                                              '${filteredExerciseList.isNotEmpty || searchLoading.isTrue ? filteredExerciseList[index].muscle : controller.newExercise[index].muscle} ',
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ));
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 20.0),
                            itemCount: filteredExerciseList.isNotEmpty ||
                                    searchLoading.isTrue
                                ? filteredExerciseList.length
                                : controller.newExercise.length))
                  ],
                ),
              ),
            );
          }

        })
    );
  }


}
