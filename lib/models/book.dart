class Book {
  String title,
      writer,
      image,
      description =
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id neque libero. Donec finibus sem viverra, luctus nisi ac, semper enim. Vestibulum in mi feugiat, mattis erat suscipit, fermentum quam. Mauris non urna sed odio congue rhoncus. \nAliquam a dignissim ex. Suspendisse et sem porta, consequat dui et, placerat tortor. Sed elementum nunc a blandit euismod. Cras condimentum faucibus dolor. Etiam interdum egestas sagittis. Aliquam vitae molestie eros. Cras porta felis ac eros pellentesque, sed lobortis mi eleifend. Praesent ut.';
  int pages;
  double rating;

  Book(this.title, this.writer, this.image, this.rating, this.pages);
}

final List<Book> books = [
  Book('A Biblioteca da Meia-Noite', 'Luizão do Gás', 'assets/images/capa1.jpg',
      3.5, 123),
  Book('Garota em Pedaços', 'Widada', 'assets/images/capa2.jpg', 4.5, 200),
  Book('Juntando os Pedaços', 'Jubilee Enterprise', 'assets/images/capa3.jpg',
      5.0, 324),
  Book('A Garota do Lago', 'Wahana Komputer', 'assets/images/capa4.jpg', 3.0,
      200),
];
