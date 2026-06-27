import 'package:ecommerce_app/model/cart_model.dart';
import 'package:ecommerce_app/view_model/cart_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('totalPrice handles currency strings with commas and symbols', () {
    final viewModel = CartViewModel();

    viewModel.addtoCart(
      CartModel(
        title: 'Product 1',
        image: 'assets/images/banner.png',
        price: 'Rs.5,000',
      ),
    );
    viewModel.addtoCart(
      CartModel(
        title: 'Product 2',
        image: 'assets/images/banner2.png',
        price: '\$1,200',
      ),
    );

    expect(viewModel.cartCount, 2);
    expect(viewModel.totalPrice, 6200.0);
  });
}
