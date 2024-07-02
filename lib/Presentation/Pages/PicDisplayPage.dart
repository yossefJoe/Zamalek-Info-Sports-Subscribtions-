import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PicDisplayPage extends StatelessWidget {
  PicDisplayPage({super.key, this.pic});
  final String? pic;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: PhotoView(
          imageProvider: AssetImage(pic!),
          backgroundDecoration: BoxDecoration(color: Colors.black),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 2,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
