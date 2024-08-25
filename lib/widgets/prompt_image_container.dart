import 'package:flutter/material.dart';

class PromptImageContainer extends StatefulWidget {
  final double width;
  final double height;
  final List<Widget> imagePicked;
  final Widget imgPicker;

  const PromptImageContainer(
      {super.key,
      required this.width,
      required this.height,
      required this.imagePicked,
      required this.imgPicker});

  @override
  State<PromptImageContainer> createState() => _PromptImageContainerState();
}

class _PromptImageContainerState extends State<PromptImageContainer> {
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
                child: Row(
                  children: [
                    widget.imgPicker,
                    Expanded(
                      child: ListView.builder(
                          itemCount: widget.imagePicked.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return widget.imagePicked[index];
                          } // Pass single XFile
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
