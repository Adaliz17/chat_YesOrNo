import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20)
    );

    final textController = TextEditingController();

    final focusNode = FocusNode();

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      decoration: InputDecoration(
        hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
          filled: true,
          suffixIcon: IconButton(
            icon: const Icon(Icons.send_outlined),
            onPressed: () {
              final textValue = textController.value.text;
              textController.clear();
              focusNode.requestFocus();
              onValue(textValue);
            },
          )),
          onFieldSubmitted: (value) {
            final textValue = textController.value.text;
              textController.clear();
              focusNode.requestFocus();
              onValue(textValue);
          },
    );
  }
}
