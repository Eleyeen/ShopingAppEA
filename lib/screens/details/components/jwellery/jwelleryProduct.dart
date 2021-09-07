import 'package:flutter/material.dart';

class Jwellery {
  String? image, title, description;
  int? price, size, id;
  Color? color;
  Jwellery({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Jwellery> jwellerys = [
  Jwellery(
      id: 1,
      title: "Nicles",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/jw1.png",
      color: Colors.pink),
  Jwellery(
      id: 2,
      title: "Braclet",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/jw2.png",
      color: Color(0xFFD3A984)),
  Jwellery(
      id: 3,
      title: "Rings",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/jw3.png",
      color: Color(0xFF989493)),
  Jwellery(
      id: 4,
      title: "Ears Rings",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/jw4.png",
      color: Color(0xFFE6B398)),
  Jwellery(
      id: 5,
      title: "Damas",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/jw5.png",
      color: Color(0xFFFB7883)),
  Jwellery(
    id: 6,
    title: "New Ruby",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/jw6.png",
    color: Color(0xFFAEAEAE),
  ),
  Jwellery(
    id: 7,
    title: "ARY",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/jw7.png",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
