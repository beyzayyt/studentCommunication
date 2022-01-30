import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentcommunications/repository/messages_repository.dart';

class MessagesPage extends StatefulWidget {
  final MessagesRepository messagesRepository;

  const MessagesPage(this.messagesRepository, {Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Messages")),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  reverse: true,
                  itemCount: widget.messagesRepository.messages.length,
                  itemBuilder: (context, index) {
                    return MessageLook(
                        widget.messagesRepository.messages[widget.messagesRepository.messages.length - index - 1]);
                  }),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(25.0))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextField(
                            decoration:
                            InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                        onPressed: () {
                          print("Send");
                        },
                        child: const Text("Send")),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class MessageLook extends StatelessWidget {
  final Message messages;

  const MessageLook(this.messages, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
      messages.sender == "Beyza" ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 8.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              color: Colors.orange.shade100,
              borderRadius:
              const BorderRadius.all(Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(messages.text),
          ),
        ),
      ),
    );
  }
}
