import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answers.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  List<Message> messagesList = [
    Message(text: "I will answer all your questions. Just remember to end them with a '?' so I can respond. 🤔", fromWho: FromWho.other)
  ];

  Future<void> sendMessage(String message) async {
    
    if(message.isEmpty) return;

    final newMessage = Message(text: message, fromWho: FromWho.me);
    messagesList.add(newMessage);

    if(message.endsWith('?')) {
      otherChatReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 150));
    chatScrollController.animateTo(
        curve: Curves.bounceIn,
        duration: const Duration(microseconds: 300),
        chatScrollController.position.maxScrollExtent);
  }

  Future<void> otherChatReply() async {
    final otherMessage = await getYesNoAnswer.getAnswer();
    messagesList.add(otherMessage);
    notifyListeners();
    moveScrollToBottom();
  }
}
