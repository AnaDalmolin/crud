import 'dart:ffi';

import 'package:flutter/material.dart';

class Fieldtextresponsive extends StatelessWidget {
  final String label;
  final double fontSize;
  final bool isNotTitle;

  const Fieldtextresponsive({
    Key? key,
    required this.label,
    required this.fontSize,
    this.isNotTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: !isNotTitle ? 15 : 5),
      child:Text(label, style: TextStyle(
        fontSize: fontSize, 
        color: !isNotTitle ?  Colors.cyan.shade700 : Colors.grey.shade600, 
        fontWeight: isNotTitle ? FontWeight.bold : FontWeight.normal,),
    ),
    );
  }
}