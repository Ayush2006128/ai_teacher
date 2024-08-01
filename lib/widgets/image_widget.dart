import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ImageWidget extends StatefulWidget {
  List<XFile> imagePicked = [];
  ImageWidget({
    super.key,
    required this.imagePicked,
  });

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  void _onRemove(int index) {
    setState(() {
      widget.imagePicked.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (int i = 0; i < widget.imagePicked.length; i++)
        Stack(children: [
          Image.file(File(widget.imagePicked[i].path),
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.1),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => _onRemove(i),
              iconSize: 20,
            ),
          ),
        ])
    ]);
  }
}
