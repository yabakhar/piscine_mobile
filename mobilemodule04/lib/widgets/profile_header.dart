import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.withOpacity(0.5),
              borderRadius: BorderRadius.circular(60),
            ),
            child: CachedNetworkImage(
              imageUrl: "https://picsum.photos/200/300",
              imageBuilder: (context, imageProvider) => Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Container(
                  height: 20,
                  width: 20,
                  padding: const EdgeInsets.all(50),
                  child: const CircularProgressIndicator(),
                );
              },
              errorWidget: (context, url, error) {
                return const Icon(Icons.error);
              },
            ),
          ),
          const Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "yabakhar",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.logout,
              color: Colors.deepPurpleAccent.withOpacity(0.5),
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
