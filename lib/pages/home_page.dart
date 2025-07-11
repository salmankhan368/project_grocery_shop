import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_grocery_shop/Model/cart_model.dart';
import 'package:project_grocery_shop/cart%20page/cart_pagge.dart';
import 'package:project_grocery_shop/component/grocey_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (contex) {
            return const CartPage();
          }),
        ),
        backgroundColor: Colors.teal,
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            //Good Morning
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text('Good Morning'),
            ),
            const SizedBox(
              height: 4,
            ),
            //lets Order fresht itemm for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Lets's order fresh Item for you",
                style: GoogleFonts.notoSerif(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            const SizedBox(
              height: 24,
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Fresh Items',
                  style: TextStyle(fontSize: 16),
                )),
            Expanded(
                child: Consumer<CartModel>(builder: (context, value, child) {
              return GridView.builder(
                  itemCount: value.shopItem.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                  itemBuilder: (context, index) {
                    return GroceyItemTile(
                      itemName: value.shopItem[index][0],
                      itemPrice: value.shopItem[index][1],
                      imagepath: value.shopItem[index][2],
                      color: value.shopItem[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index);
                      },
                    );
                  });
            }))
          ],
        ),
      ),
    );
  }
}
