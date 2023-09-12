import 'dart:async';

import 'package:digiteca/widgets/custom_button.dart';
import 'package:digiteca/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();

  final PageController _pageController = PageController();
  // final SwiperController _swiperController = SwiperController();
  int _currentPageIndex = 0;
  Timer? _timer;
  final List<String> _imagePaths = [
    'assets/images/bg1.png',
    'assets/images/bg2.png',
    'assets/images/bg3.jpeg'
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 7), (Timer timer) {
      if (_currentPageIndex < _imagePaths.length - 1) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.black, Colors.black12],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ).createShader(bounds),
          blendMode: BlendMode.darken,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _imagePaths.length,
            itemBuilder: (context, index) {
              return AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _currentPageIndex == index ? 0.5 : 0.0,
                child: BackgroundImage(imagePath: _imagePaths[index]),
              );
            },
          ),
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      //Logo
                      SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: Image.asset('assets/images/logo2.png'),
                      ),

                      const SizedBox(height: 50),
                      //textfield nome de usuário
                      CustomTextField(
                          icon: const Icon(
                            Icons.person_outline,
                            color: Colors.brown,
                          ),
                          hintText: 'Digite seu usuário',
                          obscureText: false,
                          controller: usuarioController),
                      const SizedBox(height: 10),
                      //textfield senha (data nasc)
                      CustomTextField(
                          icon: const Icon(
                            Icons.lock_open_rounded,
                            color: Colors.brown,
                          ),
                          hintText: 'Digite sua senha',
                          obscureText: true,
                          controller: senhaController),

                      const SizedBox(height: 25),

                      //Botão de entrar
                      CustomButton(
                        text: 'ENTRAR',
                        onTap: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class BackgroundImage extends StatelessWidget {
  final String imagePath;

  const BackgroundImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.1, end: 1.0).animate(
        CurvedAnimation(
          parent: ModalRoute.of(context)!.animation!,
          curve: Curves.easeInOut,
        ),
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
