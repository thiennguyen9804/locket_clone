sealed class MessageEvent {}

final class FetchNextMessagesPage extends MessageEvent {
  final int receiverId;

  FetchNextMessagesPage(this.receiverId);
}

final class SendMessageEvent extends MessageEvent {
  final String text;
  final String? imageUrl;
  final int receiverId;

  SendMessageEvent({
    required this.receiverId,
    required this.text,
    this.imageUrl,
  });
}
