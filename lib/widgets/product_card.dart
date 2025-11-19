import 'package:flutter/material.dart';
import 'package:kicks_archive/screens/productlist_form.dart';
import 'package:kicks_archive/screens/menu.dart';
import 'package:kicks_archive/screens/product_entry_list.dart';
import 'package:kicks_archive/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    // Check if there is color for ItemCard, else use the secondary colorScheme
    final Color itemCardColor;
    if (item.color != null) {
      itemCardColor = item.color!; //! for not null assertion
    } else {
      itemCardColor = Theme.of(context).colorScheme.secondary;
    }
    final request = context.watch<CookieRequest>();

    final size = MediaQuery.of(context).size;

    return SizedBox( 
      width: size.width * 0.25,
      height: size.height * 0.25,
      child: Material(
        // Background theme for the application
        color: itemCardColor,
        // Rounded edges for card
        borderRadius: BorderRadius.circular(12),

        child: InkWell(
          onTap: () async {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("You just pressed the ${item.name} button!"),
                ),
              );
            if (item.name == "Add Product") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductFormPage()),
              );
            } else if (item.name == "All Products") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryListPage(),
                ),
              );
            } else if (item.name == "My Products") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ProductEntryListPage(filterMy: true),
                ),
              );
            } else if (item.name == "Logout") {
              // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
              // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
              // If you using chrome,  use URL http://localhost:8000

              final response = await request.logout(
                "http://localhost:8000/auth/logout/",
              );
              String message = response["message"];
              if (context.mounted) {
                if (response['status']) {
                  String uname = response["username"];
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("$message See you again, $uname.")),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(message)));
                }
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.icon, color: Colors.white, size: 30.0),
                  const Padding(padding: EdgeInsets.all(3)),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    ); 
  }
}
