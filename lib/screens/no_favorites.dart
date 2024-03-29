import 'package:flutter/material.dart';
import 'package:tech_ecommerce/widgets/empty_state.dart';

class NoFavorites extends StatelessWidget {
  const NoFavorites({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          "Favorites",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: EmptyState(
        path: 'assets/images/no_favorites.png',
        title: 'No favorites yet',
        description: 'Hit the blue button down below to Create an order',
        textButton: 'Start ordering',
        onClick: () {},
      ),
    );
  }
}
