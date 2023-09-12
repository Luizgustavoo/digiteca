import 'package:digiteca/pallete.dart';
import 'package:digiteca/screens/book_screen.dart';
import 'package:digiteca/widgets/custom_list_tile.dart';
import 'package:digiteca/widgets/pulsating_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Colors.white,
      width: size.width * 0.7,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: size.height * .40,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/semfoto.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Nome do Usuário',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const PulsatingTextWidget(),
                  const SizedBox(height: 15),
                  const Text(
                    'Tempo de Leitura:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: const LinearProgressIndicator(
                      value: 0.7,
                      backgroundColor: Colors.white54,
                      minHeight: 10,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomListTile(
            icon: Icons.home_rounded,
            title: 'Home',
            onTap: () {},
          ),
          CustomListTile(
            icon: Icons.menu_book_rounded,
            title: 'Livros',
            onTap: () {
              Get.to(() => const PdfViewerPage());
            },
          ),
          CustomListTile(
            icon: Icons.list_rounded,
            title: 'Minha Lista',
            onTap: () {},
          ),
          CustomListTile(
            icon: Icons.folder_copy_rounded,
            title: 'Empréstimos',
            onTap: () {},
          ),
          CustomExpansionTile(
              icon: Icons.category,
              title: 'Categorias',
              children: [
                CustomListTile(
                  title: 'Ação',
                  onTap: () {},
                ),
                CustomListTile(
                  title: 'Aventura',
                  onTap: () {},
                ),
                CustomListTile(
                  title: 'Drama',
                  onTap: () {},
                ),
                CustomListTile(
                  title: 'Terror',
                  onTap: () {},
                ),
              ]),
          Divider(
            color: Colors.brown.shade600,
            thickness: 1.5,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5, left: 15),
                child: Text(
                  'LEITURAS RECENTES',
                  style: kDrawer,
                ),
              )
            ],
          ),
          const CustomRecentTile(
            avatarBackgroundColor: Colors.black,
            title: 'Titulo do Livro',
            image: 'assets/images/semfoto.png',
          ),
          const CustomRecentTile(
            avatarBackgroundColor: Colors.black,
            title: 'Titulo do Livro',
            image: 'assets/images/semfoto.png',
          ),
        ],
      ),
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;

  const CustomExpansionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: const RoundedRectangleBorder(),
      leading: Icon(
        icon,
        color: Colors.brown.shade900,
      ),
      title: Text(title),
      children: children,
    );
  }
}

class CustomRecentTile extends StatelessWidget {
  final Color avatarBackgroundColor;
  final String title;
  final Function()? onTap;
  final String image;

  const CustomRecentTile({
    super.key,
    required this.avatarBackgroundColor,
    required this.title,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 15,
        backgroundColor: avatarBackgroundColor,
        backgroundImage: AssetImage(image),
      ),
      title: Text(title),
    );
  }
}
