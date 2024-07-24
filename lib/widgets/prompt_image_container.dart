import 'package:ai_teacher/widgets/add_image.dart';
import 'package:ai_teacher/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PromptImageContainer extends StatefulWidget {
  final double width = 0.8;
  final double height = 0.4;
  const PromptImageContainer({super.key});

  @override
  State<PromptImageContainer> createState() => _PromptImageContainerState();
}

class _PromptImageContainerState extends State<PromptImageContainer> {
  final List<XFile> _imagePicked = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      width: context.size!.width * widget.width,
      height: context.size!.height * widget.height,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text("Upload Image"),
          AddImage(
            onTap: _addImage,
          ),
          ListView.builder(
            itemCount: _imagePicked.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ImageWidget(
              imagePicked: _imagePicked,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePicked.add(pickedFile);
      });
    }
  }
}
