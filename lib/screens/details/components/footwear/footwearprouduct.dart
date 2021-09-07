import 'package:flutter/material.dart';

class Footwearprouduct {
  String? image, title, description;
  int? price, size, id;
  Color? color;
  Footwearprouduct({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Footwearprouduct> footwearprouducts = [
  Footwearprouduct(
      id: 1,
      title: "Heels",
      price: 244,
      size: 12,
      description: dummyText,
      image: "assets/images/j1.png",
      color: Colors.pink),
  Footwearprouduct(
      id: 2,
      title: "Bata",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/j2.png",
      color: Color(0xFFD3A984)),
  Footwearprouduct(
      id: 3,
      title: "Service",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/j3.png",
      color: Color(0xFF989493)),
  Footwearprouduct(
      id: 4,
      title: "Imperial",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/j4.png",
      color: Color(0xFFE6B398)),
  Footwearprouduct(
      id: 5,
      title: "Borjan",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/j5.png",
      color: Color(0xFFFB7883)),
  Footwearprouduct(
    id: 6,
    title: "stylo",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/j6.png",
    color: Color(0xFFAEAEAE),
  ),
  Footwearprouduct(
    id: 7,
    title: "jolly",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/j7.png",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
