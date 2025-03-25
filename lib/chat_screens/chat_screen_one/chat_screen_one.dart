import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/chat_screens/chat_screen_one/model/message_model.dart';

class ChatScreenOne extends StatefulWidget {
  const ChatScreenOne({super.key});

  @override
  State<ChatScreenOne> createState() => _ChatScreenOneState();
}

class _ChatScreenOneState extends State<ChatScreenOne> {


  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<MessageModel> messageList = [
    MessageModel(text: 'Hi,how Are you', fromUser: true, time: DateTime.now().toString()),
    MessageModel(text: 'Im fine thank you', fromUser: false, time: DateTime.now().toString()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 25),
                      color: Colors.blueGrey.withOpacity(0.1),
                      spreadRadius: 0.1,
                      blurRadius: 20)
                ]),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(Icons.arrow_back),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('شاعرین', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ),



                    // navigation after send message to down of screen
                    // _scrollController.animateTo(
                    //   _scrollController.position.maxScrollExtent,
                    //   duration: const Duration(milliseconds: 300),
                    //   curve: Curves.easeOut,
                    // );

        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(16.0),
            itemCount: messageList.length,
            itemBuilder: (context, index) {
              final message = messageList[index];
              final isSentByMe = index==1 ? true:false;;
              return Row(
                mainAxisAlignment: isSentByMe ? MainAxisAlignment.start : MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: isSentByMe ? Colors.white : Color(0xff5A189A),
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(12),
                        topRight: const Radius.circular(12),
                        bottomLeft: isSentByMe ? const Radius.circular(12) : Radius.zero,
                        bottomRight: isSentByMe ? Radius.zero : const Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: isSentByMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                      children: [
                        Text(
                          message.text,
                          style: TextStyle(
                              color: isSentByMe
                                  ? Colors.black
                                  : message.error != null
                                  ? Colors.redAccent
                                  : Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          message.time,
                          style: TextStyle(
                            color: isSentByMe ? const Color(0xffF5F8FC) : const Color(0xffE4EAF0),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
                              // Input field and send button
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 20),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10, bottom: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffF5F8FC),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            maxLines: 5,
                            minLines: 1,
                            style: const TextStyle(
                                fontSize: 14,fontWeight: FontWeight.w400
                            ),
                            decoration: const InputDecoration(
                              hintText: 'شعر خود را بنویسید',
                              hintStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Color(0xff8E99B9)),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () => _sendMessage(),
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
    );
  }

  void _sendMessage(){}

}

