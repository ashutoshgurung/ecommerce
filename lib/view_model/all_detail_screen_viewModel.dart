import 'package:ecommerce_app/model/all_detail_screen_model.dart';
import 'package:flutter/material.dart';

class AllDetailScreenViewmodel extends ChangeNotifier {
  final List<AllDetailScreenModel> _allList = [
    AllDetailScreenModel(
      id: "1",
      image: "assets/images/snopyheadphone.png",
      title: "Snopy Headphone",
      description: "Snopy SN- BT96 Pretty Back Bluetooth \n Headphone ",
      price: "Rs.6,500",
      rating: 4.5,
      category: "Electronics",
    ),
 

    AllDetailScreenModel(
      id: "3",
      image: "assets/images/shoes.png",
      title: "Shoe",
      description: "Shoe",
      price: "Rs.1,500",
      rating: 4.9,
      category: "Fashion",
    ),
    AllDetailScreenModel(
      id: "4",
      image: "assets/images/guitar.png",
      title: "Guitar",
      description: "Guitar",
      price: "Rs.1,500",
      rating: 4.9,
      category: "Music",
    ),
    AllDetailScreenModel(
      id: "5",
      image:
          "assets/images/vecteezy_banana-plant-in-flowerpot-illustration_23742414.png",
      title: "Plant",
      description: "Plant",
      price: "Rs.1,500",
      rating: 4.9,
      category: "Plants",
    ),
    AllDetailScreenModel(
      id: "6",
      image: "assets/images/plant2.png",
      title: "Plant",
      description: "Plant",
      price: "Rs.1,500",
      rating: 4.9,
      category: "Plants",
    ),
    AllDetailScreenModel(
      id: "7",
      image:
          "assets/images/—Pngtree—modern and elegant living room_18246133.png",
      title: "Plant",
      description: "Pngtree—modern and elegant living room",
      price: "Rs.1,500",
      rating: 4.9,
      category: "Room Decoration",
    ),
    AllDetailScreenModel(
      id: "8",
      image: "assets/images/drone.png",
      title: "Drone",
      description:
          "drone-flying-on-farming ",
      price: "Rs.6,500",
      rating: 4.5,
      category: "Electronics",
    ),
    AllDetailScreenModel(
      id: "9",
      image: "assets/images/mac.png",
      title: "Mac",
      description: "Mac Book ",
      price: "Rs.6,500",
      rating: 4.5,
      category: "Electronics",
    ),
  ];
  List<AllDetailScreenModel> get allList => _allList;
  List<AllDetailScreenModel> getByCategory(String category) {
    return _allList.where((p) => p.category == category).toList();
  }
}
