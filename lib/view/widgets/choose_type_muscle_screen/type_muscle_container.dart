import 'package:flutter/material.dart';

import '../text_utils.dart';

var listIndex;

class TypeAndMuscleContainer extends StatelessWidget {
  final text;
  final onTap;

  TypeAndMuscleContainer({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical:
              5.0), //Container icindeki ListView Containeri alacagi alan padding ozelligini kullanark ayarliyoz
      child: InkWell(
        onTap: onTap,
        child: Container(
            //   height: 30.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ), //Container icindeki Text alacagi alan/(backgroud.grey) padding ozelligini kullanark ayarliyoz
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: TextUtils(
              text:text,
              color: Colors.black
            )),
      ),
    );
    ;
  }
}
/*
Container(
//  width: double.infinity,
height:
50.0, //listview tum ekrani kapsamamak icin height ozelligini kullanyoz ve alani sinirlandiriryoz
child: ListView.builder(
scrollDirection: Axis.horizontal,
itemCount: listLength,//her liste'nin boyutu ayri oludu icin listeye gore deger atiyoz
itemBuilder: (context, index) {

return Padding(
padding: const EdgeInsets.symmetric(
horizontal: 5.0,
vertical:
5.0), //Container icindeki ListView Containeri alacagi alan padding ozelligini kullanark ayarliyoz
child: InkWell(
onTap:() {onTap;},
child: Container(//   height: 30.0,
alignment: Alignment.center,
padding: const EdgeInsets.symmetric(
horizontal: 8.0,
), //Container icindeki Text alacagi alan/(backgroud.grey) padding ozelligini kullanark ayarliyoz
decoration: BoxDecoration(
color: Colors.grey.withOpacity(0.3),
borderRadius:
const BorderRadius.all(Radius.circular(15))),
child: TextUtils(
text: text[index],
color: Colors.black,
fontSize: 15.0,
)),
),
);
},
),
)*/
