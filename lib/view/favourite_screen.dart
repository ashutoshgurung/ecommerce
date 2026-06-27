import 'package:ecommerce_app/view_model/favourite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Favourites",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Consumer<FavouriteViewModel>(
        builder: (context, vm, child) {
          if (vm.favourites.isEmpty) {
            return Center(
              child: Text(
                "No favourite items",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: vm.favourites.length,
            itemBuilder: (context, index) {
              final item = vm.favourites[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Card(
                  color: const Color(0xff232327),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      item.image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                    title: Text(
                      item.title,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      item.price,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.green,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () => vm.toggleFavourite(item),
                      icon: Icon(
                        vm.isFavourite(item)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: vm.isFavourite(item)
                            ? Colors.red
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}