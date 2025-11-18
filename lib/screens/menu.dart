import 'package:flutter/material.dart';
import 'package:kicks_archive/widgets/product_card.dart';
import 'package:kicks_archive/widgets/left_drawer.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color? color; // ? for nullable assertion

  ItemHomepage(this.name, this.icon, [this.color]);
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.radio_button_off, Colors.blue),
    ItemHomepage("Add Product", Icons.add, Colors.red),
    ItemHomepage("Logout", Icons.logout, Colors.green),
  ];

  final String name = "Samuel Marcelino Tindaon";
  final String npm = "2406435830";
  final String kelas = "A";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kicks Archive",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: "NPM", content: npm),
                InfoCard(title: "Name", content: name),
                InfoCard(title: "Kelas", content: kelas),
              ],
            ),

            const SizedBox(height: 16.0),

            // Widget at center
            Center(
              child: Column(
                // Susun teks and grid vertically
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Kicks Archive',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  // Grid to show itemCard in 3 column grid
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // To make grid adjust the height of the content
                    shrinkWrap: true,

                    // Show ItemCard for every item in list items
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}


