import 'package:flutter/material.dart';

class ResponsiveField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const ResponsiveField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      // ignore: sized_box_for_whitespace
      child: Container(
      
        width: double.infinity, 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(
                  color: Colors.cyan.shade700,
                  fontSize: 16,
                ),
                
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.cyan.shade700, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.cyan.shade700, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}