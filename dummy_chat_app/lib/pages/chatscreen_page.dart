import 'package:flutter/material.dart';
import 'chat_message.dart';

class ChatScreenPage extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreenPage> {
  final TextEditingController _editingController = new TextEditingController();
  //Make a list of ChatMessage list and initializing it to an empty list
  final List<ChatMessage> _messages = <ChatMessage>[];

  Widget _textComposer() {
    return new IconTheme(
      // Parent
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(
                  hintText: 'Send a message.',
                ),
                controller: _editingController,
                onSubmitted: _handleSubmitted,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_editingController.text),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String message) {
    if (!["", null, false].contains(message)) {
      _editingController.clear();
      ChatMessage chatMessage = new ChatMessage(
        text: message,
      );
      //using setState because that way we will be able
      // modify _messages list
      setState(() {
        _messages.insert(0, chatMessage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(
            height: 1.0,
          ),
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: _textComposer(),
          )
        ],
      ),
    );
  }
}
