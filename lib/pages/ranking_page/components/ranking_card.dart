import 'package:flutter/material.dart';

class RankingCard extends StatelessWidget {
  const RankingCard({super.key,
    required this.number,
    // required this.image, required this.userName
  });

  final int number;
  // final Image image;
  // final String userName;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            Text('$number'),


          ],
        ),
      ),
    );
  }
}
