import 'package:flutter/material.dart';

class MySearchBarWidget extends StatelessWidget {
  final double height;
  final ValueChanged<String>? onTypeAction;
  final String? hintText;
  final TextEditingController? controller;

  const MySearchBarWidget({
    Key? key,
    this.height = 48.0, // Default height
    this.onTypeAction,
    this.hintText = "Search...", // Default hint text
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconSize = height * 0.6; // Icon size scales with height

    return Container(
      height: height,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onTypeAction,
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(height / 2),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(horizontal: height / 2),
              ),
            ),
          ),
          SizedBox(width: height / 4), // Spacing between text field and icon
          IconButton(
            icon: Icon(Icons.search, size: iconSize),
            onPressed: () {
              // You can add a search action here if needed,
              // or just rely on onTypeAction for live searching
              if (controller != null && controller!.text.isNotEmpty) {
                if (onTypeAction != null) {
                  onTypeAction!(controller!.text);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
