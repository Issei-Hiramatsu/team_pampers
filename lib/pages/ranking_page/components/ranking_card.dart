import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RankingCard extends StatelessWidget {
  const RankingCard(
      {super.key,
      required this.number,
      required this.imageUrl,
      required this.userName,
      required this.score});

  final int number;
  final String imageUrl;
  final String userName;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Text(
                '$number',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                width: 24,
              ),
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(imageUrl),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '@$userName',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Text('$score'),
            ],
          ),
        ),
      ),
    );
  }
}
