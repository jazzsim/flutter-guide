class Product {
  final String name;
  final double price;
  int count;

  Product({required this.name, required this.price, this.count = 1});

  increment() => count++;
  decrement() => count--;
}
