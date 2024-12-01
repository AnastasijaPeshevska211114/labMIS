import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16.0),
          bodyMedium: TextStyle(fontSize: 14.0),
        ),
      ),
      home: ProductList(),
    );
  }
}

class ProductList extends StatelessWidget {
  ProductList({Key? key}) : super(key: key);

  final List<Map<String, String>> products = [
    {"image": "assets/blouse1.jpg", "name": "Blouse 1", "price": "1500", "description": "Елегантна блуза за вечерни излегувања."},
    {"image": "assets/blouse2.jpg", "name": "Blouse 2", "price": "1800", "description": "Класична блуза за секојдневно носење."},
    {"image": "assets/blouse3.jpg", "name": "Blouse 3", "price": "2200", "description": "Топла блуза за зимски денови."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('211114'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the Product Details screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    product: products[index],
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.asset(products[index]['image']!, height: 300, width: 300),
                  Text(products[index]['name']!),
                  Text('${products[index]['price']} ден'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final Map<String, String> product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.asset(product['image']!, height: 300, width: 300),
            const SizedBox(height: 20),
            Text(
              product['name']!,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Цена: ${product['price']} ден',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Text(
              product['description']!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
