import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Gallery extends StatelessWidget {
  final double galleryheight;
  const Gallery({super.key, required this.galleryheight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(25.0),
          child: Text('gallery', style: TextStyle(fontSize: 65, color: CustomColor.yellowPrimary)),
        ),
        SizedBox(
          height: galleryheight,
          child: CarouselView(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              itemExtent: MediaQuery.of(context).size.width - 60,
              itemSnapping: true,
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
