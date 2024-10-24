

import 'package:flutter/material.dart';

class ButtomResponsive extends StatelessWidget {
  final String label;
  final double fontSize;
  final Function() onPressed;

  const ButtomResponsive({
    Key? key,
    required this.label,
    required this.fontSize,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return LayoutBuilder(
      builder: (context, constraints) {
       return Center(
         child: ElevatedButton(
            onPressed: () => onPressed(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan.shade700,
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.15,
                vertical: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            child: Text(label, style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
       );
      },
    );
  }
}