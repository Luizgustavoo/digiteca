import 'package:flutter/material.dart';

class PulsatingTextWidget extends StatefulWidget {
  const PulsatingTextWidget({super.key});

  @override
  State<PulsatingTextWidget> createState() => _PulsatingTextWidgetState();
}

class _PulsatingTextWidgetState extends State<PulsatingTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = ColorTween(
      begin: Colors.white,
      end: Colors.grey, // Pode ajustar a cor desejada aqui
    ).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 2, left: 2, top: 3, bottom: 3),
      decoration: BoxDecoration(
        color: _animation.value,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: const Text(
        'COMUM',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
