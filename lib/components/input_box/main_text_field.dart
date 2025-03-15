import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    super.key,
    required this.userMessageController,
  });

  final TextEditingController userMessageController;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: widget.userMessageController,
            cursorColor: ThemeProvider.themeOf(context).id == "light_theme"
                ? Colors.black
                : Colors.white,
            style: TextStyle(
              color: ThemeProvider.themeOf(context).id == "light_theme"
                  ? Colors.black
                  : Colors.white,
            ),
            minLines: 1,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "ask about anything...",
              hintStyle: TextStyle(
                color: ThemeProvider.themeOf(context).id == "light_theme"
                    ? Colors.black
                    : Colors.grey[500],
              ),
              border: InputBorder.none,
              filled: true,
              fillColor: ThemeProvider.themeOf(context).id == "light_theme"
                  ? const Color(0xfff2f2f2)
                  : const Color(0xff1a1a1a),
            ),
          ),
        ),
      ],
    );
  }
}
