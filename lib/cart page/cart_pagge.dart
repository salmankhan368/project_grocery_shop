import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_grocery_shop/Model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal,
          title: Center(
            child: Text('My cart',
                style: GoogleFonts.notoSerif(
                    fontSize: 35,
                    fontWeight: FontWeight.normal,
                    color: Colors.white)),
          ),
        ),
        body: Consumer<CartModel>(builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: value.cartItem.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: Image.asset(
                                value.cartItem[index][2],
                                height: 34,
                              ),
                              title: Text(value.cartItem[index][0]),
                              subtitle: Text('\$' + value.cartItem[index][1]),
                              trailing: IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: () => Provider.of<CartModel>(context,
                                        listen: false)
                                    .removeItemFromCart(index),
                              ),
                            ),
                          ),
                        );
                      })),
              //total price
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.teal),
                    padding: EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: TextStyle(color: Colors.green[100]),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              "\$" + value.calculateTotal(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              // color: Colors.teal.shade100,
                              // borderRadius: BorderRadius.circular(4)
                              ),
                          child: const Row(
                            children: [
                              Text(
                                'Pay now',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ],
          );
        }));
  }
}
