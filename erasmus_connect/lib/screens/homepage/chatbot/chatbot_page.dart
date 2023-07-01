import 'package:erasmus_connect/screens/homepage/chatbot/chat_item.dart';
import 'package:erasmus_connect/screens/homepage/chatbot/providers/chat_providers.dart';
import 'package:erasmus_connect/screens/homepage/chatbot/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatbotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 235, 225),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.only(left: 10),
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        // Handle button press
                      },
                      iconSize: 24,
                      splashRadius: 15,
                      color: Colors.black,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                    ),
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color.fromARGB(255, 247, 235, 225),
                                width: 2),
                            color: Color.fromARGB(255, 251, 137,
                                39), // Replace with desired color
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Assuming you have a profile image URL stored in a variable called `profileImageUrl`
                ],
              ),
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final chats = ref.watch(chatsProvider).reversed.toList();
                  return ListView.builder(
                    reverse: true,
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      return ChatItem(
                        text: chats[index].message,
                        isMe: chats[index].isMe,
                      );
                    },
                  );
                },
              ),
            ),
            TextFieldWidget(),
          ],
        ),
      ),
    );
  }
}
