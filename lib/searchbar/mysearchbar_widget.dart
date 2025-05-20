import 'package:flutter/material.dart';

class MySearchBarWidget extends StatefulWidget {
  final double height;
  final ValueChanged<String>? onTypeAction;
  final String? hintText;

  const MySearchBarWidget({
    super.key,
    this.height = 48.0, // Default height
    this.onTypeAction,
    this.hintText = "Search...", // Default hint text
  });

  @override
  State<MySearchBarWidget> createState() => _MySearchBarWidgetState();
}

class _MySearchBarWidgetState extends State<MySearchBarWidget> {
  bool _showClearButton = false;
  final TextEditingController? controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // No need to add a listener here anymore
  }

  @override
  void dispose() {
    // No need to remove a listener here anymore
    super.dispose();
  }

  void _onTextChanged(String text) {
    setState(() {
      _showClearButton = text.isNotEmpty;
    });
    if (widget.onTypeAction != null) {
      widget.onTypeAction!(text);
    }
  }

  void _clearText() {
    controller?.text = "";
    _onTextChanged(""); // Manually trigger onTypeAction with empty string
  }

  @override
  Widget build(BuildContext context) {
    final iconSize = widget.height * 0.6; // Icon size scales with height

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      height: widget.height,
      child: TextField(
        controller: controller,
        onChanged: _onTextChanged, // Directly call _onTextChanged here
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.height / 2),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: EdgeInsets.symmetric(horizontal: widget.height / 2),
          prefixIcon: Icon(Icons.search, size: iconSize), // Search icon at the beginning
          suffixIcon: _showClearButton
              ? IconButton(
                  icon: Icon(Icons.cancel, size: iconSize),
                  onPressed: _clearText,
                )
              : null,
        ),
      ),
    );
  }
}
