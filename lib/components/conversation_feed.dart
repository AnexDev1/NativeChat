import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nativechat/components/ai_response.dart';
import 'package:nativechat/components/system_response.dart';
import 'package:nativechat/components/user_input.dart';

class ConversationFeed extends StatefulWidget {
  const ConversationFeed({
    super.key,
    required this.scrollController,
    required this.chatHistory,
    required this.isOneSidedChatMode,
  });

  final ScrollController scrollController;
  final List<dynamic> chatHistory;
  final bool isOneSidedChatMode;

  @override
  State<ConversationFeed> createState() => _ConversationFeedState();
}

class _ConversationFeedState extends State<ConversationFeed> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ListView.builder(
        padding: const EdgeInsets.only(
          bottom: 200.0,
        ),
        controller: widget.scrollController,
        itemCount: widget.chatHistory.length,
        itemBuilder: (context, index) {
          final bool isUser = widget.chatHistory[index]['from'] == "user";
          final bool isSystem = widget.chatHistory[index]['from'] == "system";
          final bool isLast = index == widget.chatHistory.length - 1;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSystem
                  ? widget.isOneSidedChatMode == false
                      ? SystemResponse(
                          chatObject: widget.chatHistory[index],
                          isOneSidedChatMode: widget.isOneSidedChatMode,
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SystemResponse(
                              chatObject: widget.chatHistory[index],
                              isOneSidedChatMode: widget.isOneSidedChatMode,
                            ),
                            widget.chatHistory[index]["isError"] == true
                                ? isLast == true
                                    ? Container(
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.only(
                                          left: 16.0,
                                        ),
                                        child: Icon(
                                          Ionicons.ellipse,
                                          size: 18.0,
                                          color: Colors.grey[900],
                                        ),
                                      )
                                    : Container()
                                : Container(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: LoadingAnimationWidget.beat(
                                      color: Colors.grey[600]!,
                                      size: 14,
                                    ),
                                  ),
                          ],
                        )
                  : isUser
                      ? UserInput(
                          text: widget.chatHistory[index]['content'],
                          isOneSidedChatMode: widget.isOneSidedChatMode,
                        )
                      : AIResponse(
                          text: widget.chatHistory[index]['content'].toString(),
                          isLast: isLast,
                          isOneSidedChatMode: widget.isOneSidedChatMode,
                        ),
            ],
          );
        },
      ),
    );
  }
}
