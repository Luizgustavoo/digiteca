import 'package:digiteca/models/book.dart';
import 'package:digiteca/widgets/banner_widget.dart';
import 'package:digiteca/widgets/category_book.dart';
import 'package:digiteca/widgets/custom_drawer.dart';
import 'package:digiteca/widgets/search_input_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 5),
            const SearchInputWidget(),
            const BannerWidget(),
            CategoryBook(),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Lançamentos 📅'),
            ),
            const BookWidget(),
            // const Padding(
            //   padding: EdgeInsets.all(10.0),
            //   child: Text('Minha Lista ❤️'),
            // ),
            // const BookWidget(),
          ]),
        ],
      ),
    );
  }
}

class BookWidget extends StatelessWidget {
  const BookWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, bool> favoritos = {};
    createTile(Book book) => Hero(
          tag: book.title,
          child: Card(
            elevation: 4.0,
            shadowColor: Colors.black,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'detail/${book.title}');
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.0),
                      child: Image(
                        image: AssetImage(book.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
    return Container(
      padding: const EdgeInsets.only(left: 8),
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: createTile(book),
          );
        },
      ),
    );
  }
}
