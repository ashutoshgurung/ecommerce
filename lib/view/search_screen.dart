import 'package:ecommerce_app/core/widgets/textformfield_widget.dart';
import 'package:ecommerce_app/view/category_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              TextformfieldWidget(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Categories",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 12,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CategoryProductsScreen(
                              categoryTitle: categories[index]['title'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 239.7,
                        width: 196.23,
                        decoration: BoxDecoration(
                          color: Color(0xff232327),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Column(
                          children: [
                            Image.asset(categories[index]['image']),
                            SizedBox(height: 5),
                            Text(
                              categories[index]['title'],
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffC4C4C4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> categories = [
  {'image': "assets/images/cateelectronic.png", 'title': "Electronics"},
  {'image': "assets/images/catemusic.png", 'title': "Music"},
  {'image': "assets/images/catefashion.png", 'title': "Fashion"},
  {
    'image': "assets/images/catedigitalservice.png",
    'title': "Digital Services",
  },
  {'image': "assets/images/cateplants.png", 'title': "Plants"},
  {'image': "assets/images/cateroomdeco.png", 'title': "Room Decoration"},
];
