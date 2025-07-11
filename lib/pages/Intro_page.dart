import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_grocery_shop/pages/home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(
              left: 80,
              right: 80,
              bottom: 40,
            ),
            child: Image.asset('Images/hand.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text('We deliver vegitables\n at your doorstep',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                    fontSize: 35, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 24),
          //fresh items everyday
          const Text(
            'Fresh Items Everyday',
            style: TextStyle(color: Colors.grey),
          ),

          //get started button
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const HomePage();
            })),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.all(18),
              child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
