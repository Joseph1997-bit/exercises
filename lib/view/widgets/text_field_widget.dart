import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

var inputDecoration = InputDecoration(
  fillColor: Colors.white,
  focusColor: Colors.red,
  hintText: "Search ",
  hintStyle: const TextStyle(
    color: Colors.black54,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  ),
  contentPadding: const EdgeInsets.only(
    left: 20.0,
  ), //text'e icerden padding veya bosluk vermek icin
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(30),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(30),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(30),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(30),
  ),
);
