import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ImageWidget extends StatefulWidget {
  XFile imagePicked;
  final void Function() onRemove;
  ImageWidget({
    super.key,
    required this.imagePicked,
    required this.onRemove,
  });

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(children: [
        Image.file(File(widget.imagePicked.path),
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.1),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => widget.onRemove,
            iconSize: 20,
          ),
        ),
      ])
    ]);
  }
}
