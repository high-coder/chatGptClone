import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatgpt_flutter/providers/currentState.dart';
import 'package:chatgpt_flutter/screens/homeScreen/widgets/input_text.dart';
import 'package:chatgpt_flutter/utils/our_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OurHome extends StatefulWidget {
  const OurHome({super.key});

  @override
  State<OurHome> createState() => _OurHomeState();
}

class _OurHomeState extends State<OurHome> {
  @override
  Widget build(BuildContext context) {
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appGreyBg,
        title: Row(
          children: [
            SvgPicture.asset(
              "assets/chatGptLogo.svg",
              width: 40,
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              "CHATGPT",
              style: GoogleFonts.openSans(),
            )
          ],
        ),
        // actions: [
        //   SvgPicture.asset(
        //     "assets/chatGptLogo.svg",
        //     width: 20,
        //   )
        // ],
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: appGreyBg,
      body: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: appGreyBg,
          //resizeToAvoidBottomInset: true,
          bottomNavigationBar: BottomCommentBar(),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: Consumer<CurrentState>(
                  builder: (context, _, __) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          color: currentState.listMessages[index].whoAmI ==
                                  "chatGpt"
                              ? appGreyBg
                              : darkGrey,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child:
                                    currentState.listMessages[index].whoAmI ==
                                            "chatGpt"
                                        ? SvgPicture.asset(
                                            "assets/chatGptLogo.svg",
                                            width: 20,
                                            height: 20,
                                          )
                                        : Icon(Icons.person),
                              ),
                              Expanded(
                                  flex: 10,
                                  child: currentState
                                              .listMessages[index].whoAmI ==
                                          "chatGpt"
                                      ? AnimatedTextKit(
                                          totalRepeatCount: 1,
                                          animatedTexts: [
                                              TyperAnimatedText(
                                                  currentState
                                                      .listMessages[index]
                                                      .message,
                                                  textStyle:
                                                      GoogleFonts.openSans(
                                                          color: Colors.white))
                                            ])
                                      : Text(
                                          currentState
                                              .listMessages[index].message,
                                          style: GoogleFonts.openSans(
                                            color: Colors.white,
                                          ),
                                        ))
                            ],
                          ),
                        );
                      },
                      itemCount: currentState.listMessages.length,
                    );
                  },
                ))
              ],
            ),
          )),
    );
  }
}
