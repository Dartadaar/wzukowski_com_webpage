import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  final double galleryheight;
  const Gallery({super.key, required this.galleryheight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('live visual projects', style: TextStyle(fontSize: 70)),
        SizedBox(
          height: galleryheight,
          child: CarouselView(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              itemExtent: MediaQuery.of(context).size.width - 32,
              children: List.generate(5, (int index) {
                return Container(
                    color: Colors.grey,
                    child: Image.asset('assets/images/slidergallery/$index.jpg', fit: BoxFit.cover,));
              })),
        )
      ],
    );
  }
}
