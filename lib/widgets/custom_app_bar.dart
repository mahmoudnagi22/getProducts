import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SearchBar(),
      actions: [
        IconButton(
          iconSize: 30.0,
          icon: Icon(Icons.shopping_cart_outlined,
              color: Color.fromARGB(255, 0, 77, 139)),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'What are you searching for?',
        prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 0, 77, 139)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 77, 139)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }
}
