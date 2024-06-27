import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

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
              print('Clic al boton SEND $textValue');
              textController.clear();
              focusNode.requestFocus();
            },
          )),
          onFieldSubmitted: (value) {
            final textValue = textController.value.text;
              print('Clic al boton SEND $textValue');
              textController.clear();
              focusNode.requestFocus();
          },
    );
  }
}
