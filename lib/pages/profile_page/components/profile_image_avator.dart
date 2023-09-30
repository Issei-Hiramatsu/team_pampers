import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImageAvator extends StatelessWidget {
  const ProfileImageAvator({super.key, required this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (_) {
            return BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 20,
              ),
              child: AlertDialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                content: imageUrl != null
                    ? CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                          imageUrl!,
                        ),
                        radius: 112,
                      )
                    : const CircleAvatar(
                        radius: 112, child: Icon(Icons.person)),
              ),
            );
          },
        );
      },
      child: imageUrl != null
          ? CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                imageUrl!,
              ),
              radius: 56,
            )
          : const CircleAvatar(
              radius: 56,
              child: Icon(Icons.person),
            ),
    );
  }
}
