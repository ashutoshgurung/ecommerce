import 'package:ecommerce_app/model/favourite_screen_model.dart';
import 'package:flutter/material.dart';

class FavouriteViewModel extends ChangeNotifier {
  final List<FavouriteScreenModel> _favourites = [];

  List<FavouriteScreenModel> get favourites => _favourites;

  void toggleFavourite(FavouriteScreenModel item) {
    final index = _favourites.indexWhere((e) => e.id == item.id);
    if (index != -1) {
      _favourites.removeAt(index);
    } else {
      _favourites.add(item);
    }
    notifyListeners();
  }

  bool isFavourite(FavouriteScreenModel item) {
    return _favourites.any((e) => e.id == item.id);
  }

  void clear() {
    _favourites.clear();
    notifyListeners();
  }
}
