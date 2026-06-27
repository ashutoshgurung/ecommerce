import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/widgets/textformfield_widget.dart';
import 'package:ecommerce_app/model/favourite_screen_model.dart';
import 'package:ecommerce_app/view/cart_screen.dart';
import 'package:ecommerce_app/view/featured_detail_screen.dart';
import 'package:ecommerce_app/view_model/cart_view_model.dart';
import 'package:ecommerce_app/view_model/favourite_view_model.dart';
import 'package:ecommerce_app/view_model/featured_detail_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  final List banners = [
    'assets/images/banner.png',
    "assets/images/banner2.png",
    "assets/images/banner3.png",
  ];

  @override
  Widget build(BuildContext context) {
    // final vm = Provider.of<FavouriteViewModel>(context);
    final viewModel = Provider.of<FeaturedDetailScreenViewModel>(context);
    final featured = viewModel.productList;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Hello",
                  style: GoogleFonts.poppins(
                    color: Color(0xffC4C4C4),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ashutosh Gurung",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),

                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (_) => CartScreen()),
                    //     );
                    //   },
                    //   child: Container(
                    //     height: 50,
                    //     width: 90,
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: Colors.grey.withValues(alpha: 0.5),
                    //     ),
                    //     child: Icon(
                    //       Icons.shopping_cart_outlined,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    Consumer<CartViewModel>(
                      builder: (context, vm, child) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => CartScreen()),
                            );
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              ),

                              if (vm.cartCount > 0)
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      vm.cartCount.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              TextformfieldWidget(),
              SizedBox(height: 20),
              CarouselSlider.builder(
                itemCount: banners.length,
                itemBuilder: (context, index, realIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 160,
                      width: 405,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: Image.asset(
                        banners[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 160,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: banners.length,
                  effect: WormEffect(
                    dotHeight: 6,
                    dotWidth: 6,
                    spacing: 8,
                    strokeWidth: 0,
                    activeDotColor: Colors.white,
                    dotColor: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Featured",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 265,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featured.length,
                  itemBuilder: (context, index) {
                    final products = featured[index];
                    final favouriteItems = FavouriteScreenModel(
                      id: products.id,
                      title: products.title,
                      image: products.image,
                      price: products.price,
                    );
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OpenContainer(
                        transitionDuration: Duration(milliseconds: 500),
                        transitionType: ContainerTransitionType.fade,
                        closedElevation: 0,
                        openElevation: 0,
                        closedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(18),
                        ),
                        closedBuilder: (context, action) {
                          final products = featured[index];
                          return Container(
                            width: 170,
                            decoration: BoxDecoration(
                              color: Color(0xff232327),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: Image.asset(
                                    products.image,
                                    width: 170,
                                    height: 160,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Text(
                                    products.title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffE1E1E1),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        products.price,
                                        style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Consumer<FavouriteViewModel>(
                                        builder: (context, value, child) {
                                          return IconButton(
                                            onPressed: () {
                                              value.toggleFavourite(
                                                favouriteItems,
                                              );
                                            },
                                            icon: Icon(
                                              value.isFavourite(favouriteItems)
                                                  ? Icons.favorite
                                                  : Icons
                                                        .favorite_border_outlined,
                                              color:
                                                  value.isFavourite(
                                                    favouriteItems,
                                                  )
                                                  ? Colors.red
                                                  : Colors.white,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        openBuilder: (context, action) {
                          return FeaturedDetailScreen(product: products);
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "All",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: all.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 12,
                    ),
                    child: Container(
                      height: 125,
                      width: 600,
                      decoration: BoxDecoration(
                        color: Color(0xff232327),
                        borderRadius: BorderRadius.circular(24.32),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.32),
                              bottomLeft: Radius.circular(24.32),
                            ),
                            child: Image.asset(
                              all[index]['image']!,
                              height: 125,
                              width: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5.0,
                                  ),
                                  child: Text(
                                    all[index]['title'],
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  all[index]['subtitle'],
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  all[index]['below'],
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        all[index]['price']!,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
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

List featured = [
  {
    'image': "assets/images/featured1.png",
    'title': "Sport band",
    'price': "Rs.5,000",
  },
  {
    'image': "assets/images/featured2.png",
    'title': "Headphones",
    'price': "Rs.4,000",
  },
  {
    'image': "assets/images/featured3.png",
    'title': "Laptop",
    'price': "Rs.1,50,000",
  },
];

List<Map<String, dynamic>> all = [
  {
    'image': "assets/images/snopyheadphone.png",
    'title': "Snopy Headphone",
    'subtitle': "Snopy SN- BT96 Pretty Back Bluetooth ",
    'below': "Headphone",
    'price': "Rs.6,500",
  },
  {
    'image': "assets/images/greetingcard.png",
    'title': "Greeting Card",
    'subtitle': "Snopy SN- BT96 Pretty Back Bluetooth",
    'below': "Headphone",
    'price': "Rs 1,500",
  },
];
