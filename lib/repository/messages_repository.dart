class MessagesRepository {

  final List<Message> messages = [
    Message("Hi", "Beyza", DateTime.now().subtract(const Duration(minutes: 1))),
    Message("How are you", "Elis", DateTime.now())
  ];
}

class Message {
  late String text;
  late String sender;
  late DateTime time;

  Message(this.text, this.sender, this.time);
}