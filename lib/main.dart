import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Car car1 = Car("Nissan", model: "350Z", color: "yellow");
Car car2 = Car("Nissan", color: "red");
Car car3 = Car("Nissan");

class Car {
  String make;
  String model;
  String color;
  Car(this.make, {this.model = '', this.color = ''}) {
    print('${make}${model}${color}');
  }
  String getOptional(String str) {
    return str == null ? "" : " " + str;
  }
}
