import 'package:example_answer/state_management/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static route() => MaterialPageRoute(builder: (context) => const CartScreen());

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = context.watch<CartProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: const Color.fromARGB(255, 215, 236, 211),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...cartProvider.products.map(
                    (e) => ListTile(
                      title: Text(
                        e.name,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text("RM ${e.price}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => cartProvider.removeProduct(e),
                            icon: const Icon(
                              Icons.remove,
                            ),
                          ),
                          Text("${e.count}", style: const TextStyle(fontSize: 16)),
                          IconButton(
                            onPressed: () => cartProvider.addProduct(e),
                            icon: const Icon(
                              Icons.add,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (cartProvider.products.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Price: ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "RM ${cartProvider.totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
