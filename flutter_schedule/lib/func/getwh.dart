
import 'package:flutter/material.dart';

double getW(BuildContext context, double w){
  double result = MediaQuery.of(context).size.width * w;

  return result;
}

double getH(BuildContext context, double h){
  double result = MediaQuery.of(context).size.height * h;

  return result;
}