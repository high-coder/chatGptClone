import 'package:chatgpt_flutter/utils/our_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../providers/currentState.dart';

class BottomCommentBar extends StatefulWidget {
  BottomCommentBar({Key? key}) : super(key: key);

  @override
  State<BottomCommentBar> createState() => _BottomCommentBarState();
}

class _BottomCommentBarState extends State<BottomCommentBar> {
  TextEditingController _commentController = TextEditingController();
  FocusNode _commentFocus = FocusNode();
  Color ourWhite = Color(0xffebf7f9);
  bool enable = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CurrentState _instance = Provider.of<CurrentState>(context, listen: false);
    return Container(
      //margin: EdgeInsets.all(5),
      height: size.height / 12,
      color: darkGrey,
      child: Row(
        children: [
          Expanded(
            flex: 12,
            child: TextField(
              focusNode: _commentFocus,
              controller: _commentController,
              style: GoogleFonts.openSans(color: ourWhite, fontSize: 14),
              onTap: () {},
              onChanged: (value) {
                if (_commentController.text.isNotEmpty) {
                  // enable the comment icon
                  if (enable != true) {
                    setState(() {
                      enable = true;
                    });
                  }
                } else {
                  // disable the comment icon
                  if (enable != false) {
                    setState(() {
                      enable = false;
                    });
                  }
                }
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: enable == true ? ourWhite : const Color(0xff8b8b8b),
                  ),
                  onPressed: () {
                    if (_commentController.text.isNotEmpty) {
                      if (enable) {
                        _instance.sendMessage(_commentController.text);
                      }
                      _commentController.clear();
                      _commentFocus.unfocus();
                      enable = false;
                      setState(() {});
                    }
                  },
                ),
                contentPadding: EdgeInsets.only(left: 30, top: 14),
                hintStyle: GoogleFonts.openSans(
                    fontSize: 12, color: const Color(0xff8b8b8b)),
                hintText: "How can I help you?",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
