import 'package:ecommerce_app/view/all_detail_screen.dart';
import 'package:ecommerce_app/view_model/all_detail_screen_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allDetailScreen = context.watch<AllDetailScreenViewmodel>().allList;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "All Products",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: allDetailScreen.length,
        itemBuilder: (context, index) {
          final all = allDetailScreen[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AllDetailScreen(allDetailScreen: all),
                  ),
                );
              },
              child: Container(
                height: 125,
                width: 600,
                decoration: BoxDecoration(
                  color: const Color(0xff232327),
                  borderRadius: BorderRadius.circular(24.32),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24.32),
                        bottomLeft: Radius.circular(24.32),
                      ),
                      child: Image.asset(
                        all.image,
                        height: 125,
                        width: 110,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, color: Colors.white54),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              all.title,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            all.description,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  all.price,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}