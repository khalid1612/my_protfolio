import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_protfolio/global_widgets/common_exports.dart';
import 'package:my_protfolio/global_widgets/heading.dart';
import 'dart:js' as js;

class ExperiencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 150.0),
      // color: Colors.grey.withOpacity(.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Heading(
            title: 'Slills',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //experence
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Language
                    _title("Programmig Language"),
                    SizedBox(height: 15),
                    Wrap(
                      children: [
                        _item("Dart", ColorPalette.primary),
                        _item("Java", ColorPalette.primary),
                        _item("Python", ColorPalette.primary),
                        _item("Sql", ColorPalette.primary),
                        _item("Html", ColorPalette.primary),
                        _item("Javascript", ColorPalette.primary),
                        _item("Php", ColorPalette.primary),
                        _item("Css", ColorPalette.primary),
                        _item("C", ColorPalette.primary),
                        _item("C++", ColorPalette.primary),
                        _item("Assembly", ColorPalette.primary),
                      ],
                    ),

                    //Office
                    SizedBox(height: 30),
                    _title("Microsoft Office"),
                    SizedBox(height: 15),
                    Wrap(
                      children: [
                        _item("Word", Colors.purple),
                        _item("Excel", Colors.purple),
                        _item("Powerpoint", Colors.purple),
                      ],
                    ),

                    //Software
                    SizedBox(height: 30),
                    _title("Software"),
                    SizedBox(height: 15),
                    Wrap(
                      children: [
                        _item("Vs Code", Colors.red),
                        _item("Android Studio", Colors.red),
                        _item("Pycharm", Colors.red),
                        _item("SWI-Prolog", Colors.red),
                        _item("Arduino", Colors.red),
                        _item("Sublilme Text", Colors.red),
                        _item("Cisco Packet Tracer", Colors.red),
                        _item("Emu8086", Colors.red),
                        _item("Code Blocks", Colors.red),
                        _item("Netbeans", Colors.red),
                        _item("Eclipse", Colors.red),
                      ],
                    ),

                    //others
                    SizedBox(height: 30),
                    _title("Sdk & Others"),
                    SizedBox(height: 15),
                    Wrap(
                      children: [
                        _item("Flutter", Colors.blue),
                        _item("Linux (ubuntu) OS", Colors.blue),
                        _item("Linux (kali) OS", Colors.blue),
                      ],
                    ),
                  ],
                ),
              ),

              //sills
              Expanded(
                flex: 3,
                child: Container(
                  width: 200,
                  child: Column(
                    children: [
                      Text(
                        "Interest",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: TextStyles.fontSizeH3,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 1,
                            height: 300,
                            color: Colors.amber,
                            margin: EdgeInsets.only(right: 20),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _interest(
                                FontAwesomeIcons.robot,
                                "Robotics",
                                Colors.blue,
                              ),
                              _interest(
                                FontAwesomeIcons.biking,
                                "Bike Riding",
                                Colors.purple,
                              ),
                              _interest(
                                FontAwesomeIcons.camera,
                                "Photography",
                                Colors.red,
                              ),
                              _interest(
                                FontAwesomeIcons.video,
                                "Watching Movies",
                                Colors.orange,
                              ),
                              _interest(
                                FontAwesomeIcons.code,
                                "Programming Contest",
                                Colors.green,
                              ),

                              SizedBox(height: 50),
                              //contest
                              Text(
                                "Programming contest",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: TextStyles.fontSizeH3,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),

                              _contestSite(
                                "Uri online judge",
                                "https://www.urionlinejudge.com.br/judge/en/profile/128641",
                              ),
                              _contestSite(
                                "Hacker rank",
                                "https://www.hackerrank.com/khalidhassan",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contestSite(
    String name,
    String url,
  ) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            Container(
              width: 5,
              height: 5,
              color: Colors.pink,
              margin: EdgeInsets.only(right: 12),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  js.context.callMethod('open', ['$url']);
                },
                child: Text(name),
              ),
            ),
          ],
        ),
      );

  Widget _title(String title) => Text(
        title,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: TextStyles.fontSizeH3,
            fontWeight: FontWeight.w700,
          ),
        ),
      );

  Widget _interest(IconData icon, String text, Color color) => Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(text),
              ),
            ],
          ),
        ),
      );

  Widget _item(String title, Color color) => Container(
        margin: EdgeInsets.only(right: 8, bottom: 10),
        padding: EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: color,
            width: .5,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      );
}
