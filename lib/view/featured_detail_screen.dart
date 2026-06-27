import 'package:ecommerce_app/model/cart_model.dart';
import 'package:ecommerce_app/model/favourite_screen_model.dart';
import 'package:ecommerce_app/model/featured_detail_screen_model.dart';
import 'package:ecommerce_app/view_model/cart_view_model.dart';
import 'package:ecommerce_app/view_model/favourite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeaturedDetailScreen extends StatefulWidget {
  final FeaturedDetailScreenModel product;
  const FeaturedDetailScreen({super.key, required this.product});

  @override
  State<FeaturedDetailScreen> createState() => _FeaturedDetailScreenState();
}

class _FeaturedDetailScreenState extends State<FeaturedDetailScreen> {
  int _selectIndex = 0;
  int quantity = 1;

  void _addToCart(BuildContext context) {
    // listen: false because we are calling a method, not reading UI state
    final cartVM = context.read<CartViewModel>();
    final products = widget.product;

    for (int i = 0; i < quantity; i++) {
      cartVM.addtoCart(
        CartModel(
          title: products.title,
          image: products.image,
          price: products.price,
        ),
      );
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("$quantity x ${products.title} added to cart"),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _toggleFavourite(BuildContext context) {
    // listen: false because we are calling a method, not reading UI state
    final favouriteVM = context.read<FavouriteViewModel>();
    final products = widget.product;

    final item = FavouriteScreenModel(
      id: products.id,
      title: products.title,
      image: products.image,
      price: products.price,
    );

    favouriteVM.toggleFavourite(item);
  }

  @override
  Widget build(BuildContext context) {
    final products = widget.product;

    final favouriteItem = FavouriteScreenModel(
      id: products.id,
      title: products.title,
      image: products.image,
      price: products.price,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // Top bar — back + favourite
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Spacer(),
                    // Consumer only for the heart icon — rebuilds only this widget
                    Consumer<FavouriteViewModel>(
                      builder: (context, vm, child) {
                        return IconButton(
                          onPressed: () => _toggleFavourite(context),
                          icon: Icon(
                            vm.isFavourite(favouriteItem)
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: vm.isFavourite(favouriteItem)
                                ? Colors.red
                                : Colors.white,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Product image
              Center(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset(products.image, fit: BoxFit.contain),
                ),
              ),

              const SizedBox(height: 10),

              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  products.title,
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 5),

              // Price + rating
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      products.price,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xff232327),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.star, color: Colors.yellow),
                          const SizedBox(width: 3),
                          Text(
                            products.rating.toString(),
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Colors label
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Colors",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Color selector
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    _buildColor(Colors.black, 0),
                    const SizedBox(width: 10),
                    _buildColor(Colors.white, 1),
                    const SizedBox(width: 10),
                    _buildColor(Colors.grey, 2),
                    const SizedBox(width: 10),
                    _buildColor(Colors.pinkAccent, 3),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // Description label
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Description",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Description text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  products.description,
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),

              const SizedBox(height: 10),
              const Divider(color: Colors.white24),
              const SizedBox(height: 10),

              // Quantity + Add to cart row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Quantity selector
                      Container(
                        height: 50,
                        width: 155,
                        decoration: BoxDecoration(
                          color: const Color(0xff232327),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (quantity > 1) {
                                  setState(() => quantity--);
                                }
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              quantity.toString(),
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () => setState(() => quantity++),
                              icon: const Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ),

                      // Add to cart button — GestureDetector on whole area
                      GestureDetector(
                        onTap: () => _addToCart(context),
                        child: Container(
                          height: 50,
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Add to cart",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColor(Color color, int index) {
    return GestureDetector(
      onTap: () => setState(() => _selectIndex = index),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: _selectIndex == index ? Colors.green : Colors.transparent,
            width: 2,
          ),
        ),
        child: CircleAvatar(radius: 15, backgroundColor: color),
      ),
    );
  }
}
