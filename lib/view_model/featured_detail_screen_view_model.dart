import 'package:ecommerce_app/model/featured_detail_screen_model.dart';
import 'package:flutter/material.dart';

class FeaturedDetailScreenViewModel extends ChangeNotifier {
    final List<FeaturedDetailScreenModel> _productList = [
    FeaturedDetailScreenModel(
      id: "1",
      image: "assets/images/featured1.png",
      title: "Sport Band",
      description:
          "A lightweight and durable fitness companion designed to track your daily activities, workouts, heart rate, and sleep. With a comfortable fit and smart features, it helps you stay active, healthy, and connected throughout the day.",
      price: "Rs.5,000",
      rating: 4.2,
    ),
    FeaturedDetailScreenModel(
      id: "2",
      image: "assets/images/featured2.png",
      title: "HeadPhones",
      description:
          "Best all-rounder (sound + noise cancellation + comfort) Super comfortable, very clean sound",
      price: "Rs.4,000",
      rating: 4.5,
    ),
    FeaturedDetailScreenModel(
      id: "3",
      image: "assets/images/featured3.png",
      title: "Laptop",
      description:
          "A laptop is a portable computer that combines a screen, keyboard, and trackpad in a single compact device. It is used for studying, working, gaming, and entertainment, offering powerful performance while being easy to carry anywhere.",
      price: "Rs.1,50,000",
      rating: 4.9,
    ),
  ];
  List<FeaturedDetailScreenModel> get productList => _productList;
}
