import 'package:exercises/models/exercises_model.dart';

import '../helper/api_request.dart';

class GetAllExerciseService{
  //json verileri list tipinden oldugu icin list olark bi fonks tanimladik
  Future<List<ExercisesModel>> getAllExercises({ var type, var muscle,var name}) async {
    //Api class hem response kotrol ediyo hemde bize dynamic olark jsondecode deger donduruyo
    // oYuzden List<dynamic> tipinden bi dehiskene atiyoz boylece kod daha duzgun ve uygun hale gelmistir
    List<dynamic> data = await Api().get(type: type,muscle:muscle,name: name );


    List<ExercisesModel> exerciseList=[];
    for(int i =0;i <data.length;i++ ) {
      //ProductModel.fromJson is used to convert the JSON data of the i-th element of the data list into a ProductModel object.
      //gelen bilgiyi ProductModel tipine cevirdikten sonra her urun sirayla productModel tipinden bi listeye ekleyip saklayabiliriz
      exerciseList.add(ExercisesModel.fromJson(data[i]));
      //her type ve icindeki degerler bu sekilde listeye atip sakliyoruz
    }
    return exerciseList;

  }
}