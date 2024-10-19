import '../Constants.dart';

class Message
{
  final String content;

  Message(this.content);

  factory Message.fromjson(json)
  {
    return Message(json[kMessages]);
  }
}