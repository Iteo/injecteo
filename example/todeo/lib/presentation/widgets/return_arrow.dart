import 'package:flutter/material.dart';

class ReturnArrow extends StatelessWidget {
  const ReturnArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.maybePop(context);
      },
      icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
    );
  }
}
