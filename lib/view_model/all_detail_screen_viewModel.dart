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
    ),
    AllDetailScreenModel(
      id: "2",
      image: "assets/images/greetingcard.png",
      title: "Greeting Card",
      description: "Greeting card",
      price: "Rs.1,500",
      rating: 4.9,
    ),
  ];
  List<AllDetailScreenModel> get allList => _allList;
}
