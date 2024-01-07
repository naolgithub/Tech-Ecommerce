import 'package:flutter/material.dart';
import 'package:tech_ecommerce/screens/checkout.dart';
import 'package:tech_ecommerce/widgets/button.dart';
import 'package:tech_ecommerce/widgets/cart_item.dart';

// Carrito de compras
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F8),
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
          "Basket",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.delete_outline,
              size: 28,
              color: Color(0xFFFA4A0C),
            ),
            onPressed: () {
              // do something
            },
          ),
          const SizedBox(width: 8)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: InfoAlert(),
            ),
            Expanded(
              child: ListView(children: const [
                CartItem(
                  assetPath: 'assets/images/tablet.png',
                  title: '2020 Apple iPad Air 10.9"',
                  price: 579,
                ),
                CartItem(
                  title: 'APPLE AirPods Pro - White',
                  assetPath: 'assets/images/airpods.png',
                  price: 375,
                ),
              ]),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total',
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  '\$ 954',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5956E9),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            LargeButton(
              text: 'Checkout',
              onClick: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Checkout()),
                );
              },
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

class InfoAlert extends StatelessWidget {
  const InfoAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Card(
          color: const Color(0XFFD3F2FF),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none_outlined),
                onPressed: () {},
                iconSize: 28,
              ),
              const Text(
                'Delivery for FREE until the end of the month',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ),
              const SizedBox(width: 12)
            ],
          ),
        ));
  }
}
