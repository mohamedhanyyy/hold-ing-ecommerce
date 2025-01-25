import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/shared/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final BoxFit fit;
  final double? height;
  final double? width;

  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.loadingWidget,
     this.width,
    this.height,
    this.errorWidget,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      placeholder: (context, url) =>
          loadingWidget ??
          const CustomLoadingWidget(),
      errorWidget: (context, url, error) =>
          errorWidget ??
          const Center(
            child: Icon(
              Icons.info,
              color: Colors.red,
              size: 20,
            ),
          ),
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: fit),
          ),
        );
      },
    );
  }
}
