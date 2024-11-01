import 'package:example_answer/state_management/answers/cart_screen.dart';
import 'package:example_answer/state_management/product.dart';
import 'package:example_answer/state_management/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Product> products = [
  Product(name: "Burger A", price: 9.99),
  Product(name: "Fries A", price: 5.99),
  Product(name: "Drink A", price: 2.99),
];

class Ans1 extends StatelessWidget {
  static route(BuildContext context) => MaterialPageRoute(
        builder: (context) => const Ans1(),
      );

  const Ans1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          CartScreen.route(),
        ),
        child: Stack(
          children: [
            const Center(
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 40,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  context.watch<CartProvider>().totalCount == 0 ? "" : "${context.watch<CartProvider>().totalCount}",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return Card(
              elevation: 5,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "RM ${product.price}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    FilledButton(
                        onPressed: () {
                          context.read<CartProvider>().addProduct(product);
                        },
                        child: const Text("Add to Cart")),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
