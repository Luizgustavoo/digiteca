import 'package:digiteca/models/book.dart';
import 'package:digiteca/pallete.dart';

import 'rating_bar.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final Book book;

  const Detail(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    //app bar
    final appBar = AppBar(
      elevation: 0,
      title: Text(
        book.title,
        style: kAppBar,
      ),
      backgroundColor: Colors.black87,
    );

    ///detail of book image and it's pages
    final topLeft = Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Hero(
            tag: book.title,
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10.0,
              shadowColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: AssetImage(book.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Text(
          '${book.pages} Páginas',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );

    ///detail top right
    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(book.title,
            size: 16, isBold: true, padding: const EdgeInsets.only(top: 16.0)),
        text(
          'Autor: ${book.writer}',
          color: Colors.white,
          isBold: true,
          size: 14,
          padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
        ),
        Row(
          children: [RatingBar(rating: book.rating)],
        ),
        const SizedBox(height: 56.0),
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.menu_book_rounded),
            label: const Text('Ler')),
      ],
    );

    final topContent = Container(
      color: Colors.grey.withAlpha(150),
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(flex: 2, child: topLeft),
          Flexible(flex: 3, child: topRight),
        ],
      ),
    );

    ///scrolling text description
    final bottomContent = SizedBox(
      height: 260.0,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Sinopse: ${book.description}',
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 18.0,
            height: 1.5,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [topContent, bottomContent, const ComentarioWidget()],
      ),
    );
  }

  ///create text widget
  text(String data,
          {Color color = Colors.black87,
          num size = 14,
          EdgeInsetsGeometry padding = EdgeInsets.zero,
          bool isBold = false}) =>
      Padding(
        padding: padding,
        child: Text(
          data,
          style: TextStyle(
              color: color,
              fontSize: size.toDouble(),
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
      );
}

class ComentarioWidget extends StatelessWidget {
  const ComentarioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), // Cor da borda
          borderRadius: BorderRadius.circular(10.0), // Borda arredondada
        ),
        child: Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Escreva um comentário...',
                  border:
                      InputBorder.none, // Remover a borda do campo de entrada
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.send,
                color: Colors.amber,
              ),
              onPressed: () {
                // Lógica para enviar o comentário
              },
            ),
          ],
        ),
      ),
    );
  }
}
