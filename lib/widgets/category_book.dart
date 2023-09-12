import 'package:flutter/material.dart';

class CategoryBook extends StatefulWidget {
  CategoryBook({super.key});

  final List<String> _categoryLabel = [
    'Ação',
    'Aventura',
    'Romance',
    'Terror',
    'Infanto Juvenil',
    'Humor'
  ];

  @override
  State<CategoryBook> createState() => _CategoryBookState();
}

class _CategoryBookState extends State<CategoryBook> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Categorias'),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget._categoryLabel.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: ActionChip(
                                // backgroundColor: Colors.black87,
                                onPressed: () {},
                                label: Text(widget._categoryLabel[index])),
                          );
                        }))
              ],
            ),
          )
        ],
      ),
    );
  }
}
