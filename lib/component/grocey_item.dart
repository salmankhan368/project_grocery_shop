import 'package:flutter/material.dart';

class GroceyItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagepath;
  final color;
  void Function()? onPressed;

  GroceyItemTile(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagepath,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: color[100]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //image
            Image.asset(
              imagepath,
              height: 120,
            ),
            //item name
            Text(itemName),
            //price+button
            MaterialButton(
              onPressed: onPressed,
              color: color[100],
              child: Text(
                '\$' + itemPrice,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
