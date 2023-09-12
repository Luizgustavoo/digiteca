import 'package:digiteca/pallete.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(10),
        ),
        child: PageView(
          children: const [
            Center(child: Text('Banner1', style: kHead)),
            Center(child: Text('Banner2', style: kHead)),
            Center(child: Text('Banner3', style: kHead)),
            Center(child: Text('Banner4', style: kHead)),
          ],
        ),
      ),
    );
  }
}
