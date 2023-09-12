import 'package:flutter/material.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 14.0, right: 14.0, top: 10, bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: const TextField(
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'Pesquisar livros...',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.search_rounded)),
        ),
      ),
    );
  }
}
