import 'package:flutter/material.dart';
import 'package:renmo_admin/widgets/header.dart';

import '../../utils/constants.dart';
import '../../utils/utility.dart';

class ChatScreen extends StatefulWidget {
  final bool isSupport;

  const ChatScreen({super.key, this.isSupport = true});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [];

  final TextEditingController _textEditingController = TextEditingController();

  void _addMessage(String message, Sender sender) {
    setState(() {
      messages.add(Message(text: message, sender: sender));
    });
    _textEditingController.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messages = widget.isSupport
        ? [
            Message(
                text:
                    'Hi, I wanted to ask if it will be possible to rent a photocamera from you for professional use. I didn’t find any products available.',
                sender: Sender.user),
            Message(
                text:
                    'Hi Felix,Yes, we do have some cameras available. Please check Hobbies > Photo for available options. There are some Canon and Nikon cameras available which might suit your needs.',
                sender: Sender.other),
            Message(text: 'Thanks, found it!', sender: Sender.user),
            Message(
                text: 'Good to hear. Let us know if we can help you further.',
                sender: Sender.other),
          ]
        : [
            Message(
                text:
                    'Hi Felix,I arrived in front of your building but cannot find the entrance. Can you assist?',
                sender: Sender.user),
            Message(
                text: 'i’ll come down just wait there pls',
                sender: Sender.other),
          ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          const Header(
            title: "Customer Support",
          ),
          const SizedBox(height: defaultPadding),
          backWidget(context),
          const SizedBox(height: defaultPadding),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Const.kGray),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(Const.horizontalPadding),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              visualDensity:
                                  VisualDensity(horizontal: -4, vertical: -4),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(Const.profile),
                              ),
                              title: Text(
                                "Felix Baumgartner",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                        Text(
                          "Order no 293923",
                          style: TextStyle(
                              color: Const.kPrimary, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Const.horizontalPadding),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SubHeader(title: "Email address"),
                            SizedBox(height: 8),
                            Text("felix.baumgartner@gmail.com")
                          ],
                        ),
                        SizedBox(width: defaultPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SubHeader(title: "Phone number"),
                            SizedBox(height: 8),
                            Text("+372 5555 5555")
                          ],
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Const.horizontalPadding),
                    child: Divider(
                      color: Const.kPrimary,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: messages.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        final message = messages[index];

                        final isUserMessage = message.sender == Sender.user;
                        final borderRadius = BorderRadius.only(
                          topLeft: isUserMessage
                              ? Radius.zero
                              : const Radius.circular(12.0),
                          topRight: !isUserMessage
                              ? Radius.zero
                              : const Radius.circular(12.0),
                          bottomLeft: const Radius.circular(12.0),
                          bottomRight: const Radius.circular(12.0),
                        );
                        return ListTile(
                          title: Align(
                            alignment: messages[index].sender == Sender.user
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (isUserMessage)
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(Const.profile)),
                                  ),
                                Flexible(
                                  child: Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 500),
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: messages[index].sender == Sender.user
                                          ? Const.kPrimary
                                          : Const.kSecondary,
                                      borderRadius: borderRadius,
                                    ),
                                    child: Text(
                                      messages[index].text,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                if (!isUserMessage)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: widget.isSupport
                                        ? CircleAvatar(
                                            backgroundColor: Const.kGray,
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Image.asset(Const.appLogo),
                                            ),
                                          )
                                        : const CircleAvatar(
                                            backgroundImage:
                                                AssetImage(Const.profile)),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Const.horizontalPadding),
                    child: Column(
                      children: [
                        const Divider(color: Const.kPrimary),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.attach_file,
                                  color: Const.kSecondary),
                              const SizedBox(width: 8),
                              const Icon(Icons.emoji_emotions,
                                  color: Const.kSecondary),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  controller: _textEditingController,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Message',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16)),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.send),
                                      onPressed: () {
                                        if (_textEditingController
                                            .text.isNotEmpty) {
                                          _addMessage(_textEditingController.text,
                                              Sender.other);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum Sender {
  user,
  other,
}

class Message {
  final String text;
  final Sender sender;

  Message({required this.text, required this.sender});
}
