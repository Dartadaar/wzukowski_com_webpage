import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('live visual art', style: TextStyle(fontSize: 70)),
        SizedBox(
          height: 240,
          child: CarouselView(
              itemExtent: MediaQuery.of(context).size.width - 32,
              children: List.generate(10, (int index) {
                return Container(
                    color: Colors.grey,
                    child: Image.network(
                        'https://picsum.photos/400?random=$index',
                        fit: BoxFit.cover));
              })),
        )
      ],
    );
  }
}
