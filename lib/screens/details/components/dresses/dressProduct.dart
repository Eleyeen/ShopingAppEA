import 'package:flutter/material.dart';

class DressProduct {
  String? image, title, description;
  int? price, size, id;
  Color? color;
  DressProduct({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<DressProduct> dressProductslist = [
  DressProduct(
      id: 1,
      title: "J.",
      price: 123,
      size: 12,
      description: dummyText,
      image: "assets/images/d1.png",
      color: Color(0xFF3D82AE)),
  DressProduct(
      id: 2,
      title: "Khaadi",
      price: 105,
      size: 8,
      description: dummyText,
      image: "assets/images/d2.png",
      color: Color(0xFFD3A984)),
  DressProduct(
      id: 3,
      title: "Gul Ahmmad",
      price: 221,
      size: 10,
      description: dummyText,
      image: "assets/images/d3.png",
      color: Color(0xFF989493)),
  DressProduct(
      id: 4,
      title: "Warda",
      price: 100,
      size: 11,
      description: dummyText,
      image: "assets/images/d4.png",
      color: Color(0xFFE6B398)),
  DressProduct(
      id: 5,
      title: "limlight",
      price: 102,
      size: 12,
      description: dummyText,
      image: "assets/images/d5.png",
      color: Color(0xFFFB7883)),
  DressProduct(
    id: 6,
    title: "Saphire",
    price: 231,
    size: 12,
    description: dummyText,
    image: "assets/images/d6.png",
    color: Color(0xFFAEAEAE),
  ),
  DressProduct(
    id: 7,
    title: "Etnic",
    price: 120,
    size: 12,
    description: dummyText,
    image: "assets/images/d7.png",
    color: Color(0xFFAEAEAC),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
