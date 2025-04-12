import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExploreLayout extends StatelessWidget {
  const ExploreLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    "Find products easier here",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          _productImage("Lamp"),
          SizedBox(height: 20),
          _productImage("Car"),
          SizedBox(height: 20),
          _productImage("Plant"),
        ],
      ),
    );
  }
}

Widget _productImage(name) {
  return Container(
    width: 400,
    height: 220,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                color: Colors.cyan[700],
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
            ),
            Positioned(
              top: 40,
              left: 150,
              child: Column(
                children: [
                  Icon(FontAwesomeIcons.images, color: Colors.white, size: 70),
                  Text("image here", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 15, 0, 10),
          child: Text(
            "$name",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ],
    ),
  );
}

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome back,"),
                  Text(
                    "Samantha William",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: Icon(MaterialSymbols.shopping_cart),
                  ),
                  Positioned(
                    right: 5,
                    top: 3,
                    child: Container(
                      alignment: Alignment.center,
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                      child: Text(
                        "2",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 340,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(FontAwesomeIcons.magnifyingGlass, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      "Searching item",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(FontAwesomeIcons.sliders, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            width: 400,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.cyan[700],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.images, color: Colors.white, size: 80),
                Text(
                  "Image Here",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _iconCircle(Colors.green),
              SizedBox(width: 10),
              _iconCircle(Colors.grey[400]),
              SizedBox(width: 10),
              _iconCircle(Colors.grey[400]),
              SizedBox(width: 10),
              _iconCircle(Colors.grey[400]),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _cartIcon(FontAwesomeIcons.music, "Music"),
              _cartIcon(FontAwesomeIcons.solidBuilding, "Property"),
              _cartIcon(FontAwesomeIcons.gamepad, "Game"),
              _cartIcon(FontAwesomeIcons.mobile, "Gadget"),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _cartIcon(FontAwesomeIcons.tv, "Electronic"),
              _cartIcon(FontAwesomeIcons.scissors, "Property"),
              _cartIcon(FontAwesomeIcons.truck, "Game"),
              _cartIcon(FontAwesomeIcons.book, "Book"),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Best Seller",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "See all",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _cartProduct("Plant"),
              _cartProduct("Lamp"),
              _cartProduct("Chair"),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _cartProduct(name) {
  return Container(
    height: 150,
    width: 120,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            width: 120,
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.images, color: Colors.white, size: 40),
                Text(
                  "Image Here",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$name", style: TextStyle(fontSize: 14)),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidStar,
                      color: Colors.yellow[700],
                      size: 12,
                    ),
                    Icon(
                      FontAwesomeIcons.solidStar,
                      color: Colors.yellow[700],
                      size: 12,
                    ),
                    Icon(
                      FontAwesomeIcons.solidStar,
                      color: Colors.yellow[700],
                      size: 12,
                    ),
                    Icon(
                      FontAwesomeIcons.solidStar,
                      color: Colors.yellow[700],
                      size: 12,
                    ),
                    Icon(
                      FontAwesomeIcons.solidStar,
                      color: Colors.yellow[700],
                      size: 12,
                    ),
                    SizedBox(width: 5),
                    Text("5.0", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _cartIcon(icons, texts) {
  return Column(
    children: [
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(icons, color: Colors.cyan),
      ),
      Text("$texts"),
    ],
  );
}

Widget _iconCircle(colors) {
  return Icon(FontAwesomeIcons.solidCircle, size: 8, color: colors);
}
