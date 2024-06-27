import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/other_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';
import 'package:yes_no_app/presentation/widgets/theme/theme_dialog.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://img.freepik.com/free-vector/modern-question-mark-template-idea-message-vector_1017-47932.jpg?size=338&ext=jpg&ga=GA1.1.1141335507.1719360000&semt=sph'),
          ),
        ),
        title: const Text(
          'Genius',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.color_lens),
            onPressed: () {
              ThemeDialog.show(context);
            },
          ),
        ],
        centerTitle: true,
      ),
     body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messagesList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messagesList[index];
                      return (message.fromWho == FromWho.me)
                          ? MyMessageBubble(
                              message: message,
                            )
                          : OtherMessageBubble(message: message);
                    })),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
