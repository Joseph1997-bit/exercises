import 'package:flutter/material.dart';


class TextUtils extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  const TextUtils({
    required this.text,
     this.fontSize=15.0,
     this.fontWeight=FontWeight.normal, //FontWeight degeri defulat olarak normal yaptik yani deger atmasak bile hata vermez ve istedgimiz yerde kullanip farkli deger atabiliriz optional/secmeli oldu
      this.color=Colors.black,

  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
       );
  }
}