import 'package:google_fonts/google_fonts.dart';
import 'package:my_protfolio/global_widgets/button.dart';
import 'package:my_protfolio/global_widgets/common_exports.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';

import '../../assets.dart';
import 'dart:js' as js;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 150,
      padding: const EdgeInsets.symmetric(horizontal: 150.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChatBubble(
                    clipper: ChatBubbleClipper6(type: BubbleType.sendBubble),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 20),
                    backGroundColor: Colors.blue,
                    child: Text(
                      "I'm",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    "Md. Khalid Hassan",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    "App Developer",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  SizedBox(height: 50),

                  //button

                  Button(
                    text: "Download CV",
                    onTap: () {
                      js.context.callMethod('open', [
                        'https://drive.google.com/drive/u/2/folders/1EpVd8EslP717PeLPfzVWNi-lrqDw1rKk'
                      ]);
                    },
                  ),
                ],
              ),
            ),

            //image
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.owner),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(125),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
