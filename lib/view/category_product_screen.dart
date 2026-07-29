import 'package:ecommerce_app/model/all_detail_screen_model.dart';
import 'package:ecommerce_app/view/all_detail_screen.dart';
import 'package:ecommerce_app/view_model/all_detail_screen_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryTitle;
  const CategoryProductsScreen({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<AllDetailScreenViewmodel>().getByCategory(
      categoryTitle,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          categoryTitle,
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      body: products.isEmpty
          ? Center(
              child: Text(
                "No items in this category yet",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final AllDetailScreenModel p = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AllDetailScreen(allDetailScreen: p),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 12,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff232327),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(p.image, fit: BoxFit.contain),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            p.title,
                            style: GoogleFonts.poppins(
                              color: const Color(0xffC4C4C4),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            p.price,
                            style: GoogleFonts.poppins(color: Colors.white),
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
