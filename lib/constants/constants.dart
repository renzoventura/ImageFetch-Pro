import 'package:flutter/material.dart';

String pixabayTitle = "Pixabay";
String search = "Search";
String loading = "Loading";
String noResults = "No Results";
String failedToRetrieveData = "Failed to retrieve data";

int debouncerMilliseconds = 500;
int pixabayApiPerPageReturnNumber = 50;
OutlineInputBorder searchInputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none);

TextStyle logoTextStyle = const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w800,
  fontSize: 17,
);

///Colors
Color darkGrey = const Color(0xff8F8D91);
Color lightGrey = const Color(0xffEAEAEB);
Color orangeCursor = const Color(0xffEF992A);
