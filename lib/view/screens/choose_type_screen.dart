
import 'package:exercises/logic/controllers/exercise_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';
import '../widgets/choose_type_muscle_screen/type_muscle_container.dart';
import '../widgets/text_utils.dart';
import 'home_screen.dart';

class ChooseTypeAndMuscle extends StatefulWidget {
  ChooseTypeAndMuscle({Key? key}) : super(key: key);

  @override
  State<ChooseTypeAndMuscle> createState() => _ChooseTypeAndMuscleState();
}

String selectedType = '';
String selectedMuscle = '';
class _ChooseTypeAndMuscleState extends State<ChooseTypeAndMuscle> {
  final controller = Get.put(ExerciseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtils(
                        text: 'Filter',
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w700),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            selectedType = '';
                            selectedMuscle = '';
                          });
                        },
                        child: const TextUtils(
                            text: 'Clear Selection',
                            color: Colors.blue,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                Divider(
                    color: Colors.grey.withOpacity(0.7),
                    thickness:
                        1.0), //ekranda cizgi vermek icin Divider kullandim
                TextUtils(text: 'Type', color: Colors.black.withOpacity(0.9)),
                //   const SizedBox(height: 10.0),
                SizedBox(
                  height:
                      50.0, //listview tum ekrani kapsamamak icin height ozelligini kullanyoz ve alani sinirlandiriryoz
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: exercisesTypeList
                        .length, //her liste'nin boyutu ayri oludu icin listeye gore deger atiyoz
                    itemBuilder: (context, index) {
                      return TypeAndMuscleContainer(
                        text: exercisesTypeList[index],
                        onTap: () {
                          setState(() {
                            selectedType = exercisesTypeList[index];
                          });
                        },
                      );
                    },
                  ),
                ),
                Divider(color: Colors.grey.withOpacity(0.3)),
                TextUtils(text: 'Muscle', color: Colors.black.withOpacity(0.9)),
                // const SizedBox(height: 10.0),
                SizedBox(
                  //  width: double.infinity,
                  height:
                      50.0, //listview tum ekrani kapsamamak icin height ozelligini kullanyoz ve alani sinirlandiriryoz
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: musclesList
                        .length, //her liste'nin boyutu ayri oludu icin listeye gore deger atiyoz
                    itemBuilder: (context, index) {
                      return TypeAndMuscleContainer(
                        text: musclesList[index],
                        onTap: () {
                          setState(() {
                            selectedMuscle = musclesList[index];
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 50.0,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 0),
                  top: selectedMuscle.isEmpty
                      ? 20
                      : 0, //Top ozelligi ile stack icinde bu widget hem yeri hemde baska widget gelice nerye hareket edecegini belirleyebiliriz
                  left: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: TextUtils(
                        text: selectedType.isEmpty
                            ? ""
                            : "Selected Type: $selectedType "),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 0),
                  top: selectedType == '' ? 20 : 20,
                  left: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextUtils(
                        text: selectedMuscle == ""
                            ? ""
                            : "Selected Muscle: $selectedMuscle"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          InkWell(
            onTap: () async {


              Navigator.pop(context);
          controller.getExercise( muscle: selectedMuscle ?? "",
              type: selectedType ??//eger selected deger null ise bu('') degeri gonder degilse secilien degeri at
                  "");
         filteredExerciseList.value=[];//Apply buttoni bastiktan sonra bos bi deger listeye atiyom istedigmiz bilgiler ciksin diye
           searchLoading.value=false;//false degeri verdim eger arama alaninda bir harf varsa bilgiler sikintisiz gosterileck



              //selectedMuscle = '';
             // selectedType = '';
            //  print(controller.newExercise[0].name);
             // print(controller.newExercise.length);
              print('Apply');
            },
            child: Container(
              height: 55.0,
              alignment: Alignment.center,
              color: Colors.grey.withOpacity(0.3),
              child: const TextUtils(text: 'Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
