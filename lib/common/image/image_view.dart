import 'package:base_flutter/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageView extends StatelessWidget {
  const ImageView(
      {super.key,
      required this.link,
      this.width = double.infinity,
      this.height,
      this.radius});

  final String link;
  final double width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 110.spMin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 6.spMin),
        child: CachedNetworkImage(
          imageUrl: link,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: MyColor.primary.withOpacity(0.1),
            padding: const EdgeInsets.all(25),
            child: const Icon(Icons.image),
          ),
          errorWidget: (context, url, error) => Container(
            color: MyColor.primary.withOpacity(0.1),
            padding: const EdgeInsets.all(25),
            child: const Icon(Icons.image_not_supported_outlined),
          ),
        ),
      ),
    );
  }
}
