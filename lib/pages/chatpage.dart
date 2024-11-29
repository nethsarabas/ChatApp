import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'text': "Hello, How the day?",
      'isSentByMe': false,
    },
    {
      'text': "Hello, How the day?",
      'isSentByMe': true,
    },
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _messageController.text,
          'isSentByMe': true,
        });
        _messageController.clear();
      });
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff553370),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_outlined, color: const Color(0xffc199cd)),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    "Savindu Nethsara",
                    style: TextStyle(
                      color: const Color(0xffc199cd),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Chat Messages Container
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    // Messages List
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          return _buildMessageBubble(
                            _messages[index]['text'],
                            _messages[index]['isSentByMe'],
                          );
                        },
                      ),
                    ),

                    // Message Input Area
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _messageController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type a message",
                                    hintStyle: TextStyle(color: Colors.black45),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFf3f3f3),
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: Icon(
                                    Icons.send,
                                    color: const Color.fromARGB(255, 164, 154, 154),
                                  ),
                                ),
                                onPressed: _sendMessage,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(String message, bool isSentByMe) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        decoration: BoxDecoration(
          color: isSentByMe 
            ? const Color.fromARGB(255, 44, 64, 106)
            : const Color(0xFFfafbfd),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
            bottomLeft: isSentByMe 
              ? const Radius.circular(10) 
              : Radius.zero,
            bottomRight: isSentByMe 
              ? Radius.zero 
              : const Radius.circular(10),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isSentByMe ? Colors.white : Colors.black,
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}