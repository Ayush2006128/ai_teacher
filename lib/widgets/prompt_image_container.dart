import 'package:ai_teacher/widgets/add_image.dart';
import 'package:ai_teacher/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PromptImageContainer extends StatefulWidget {
  final double width;
  final double height;
  const PromptImageContainer(
      {super.key, required this.width, required this.height});

  @override
  State<PromptImageContainer> createState() => _PromptImageContainerState();
}

class _PromptImageContainerState extends State<PromptImageContainer> {
  final List<XFile> _imagePicked = [];

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: widget.width,
        heightFactor: widget.height,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
              )),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Expanded(child: Text("Upload Image")),
              Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  height: 100, // Constrain the height of the list view
                  child: ListView.builder(
                      itemCount: _imagePicked.length + 1,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == _imagePicked.length) {
                          return AddImage(
                            onTap: _addImage,
                          );
                        } else {
                          return ImageWidget(imagePicked: _imagePicked);
                        }
                      } // Pass single XFile
                      ),
                ),
              ),
            ],
          ),
        ));
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
