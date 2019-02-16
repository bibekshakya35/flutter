import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final List<String> products;

  Product(this.products);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products
          .map((element) => Card(
                child: Column(
                  children: <Widget>[
                    Image.asset('asests/food.jpg'),
                    Text(element)
                  ],
                ),
              ))
          .toList(),
    );
  }
}
