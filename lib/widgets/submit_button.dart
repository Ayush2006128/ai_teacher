import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final bool isDisabled;

  const SubmitButton({super.key, required this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled
          ? null
          : () {
              Navigator.pushNamed(context, '/answer_page');
            },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width * 0.6,
            MediaQuery.of(context).size.height * 0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        foregroundColor: isDisabled ? Colors.grey : Colors.white,
        backgroundColor: isDisabled ? Colors.white : Colors.black,
      ),
      child: const Text('Submit'),
    );
  }
}
