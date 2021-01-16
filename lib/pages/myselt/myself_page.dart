import 'package:google_fonts/google_fonts.dart';
import 'package:my_protfolio/data/data.dart';
import 'package:my_protfolio/global_widgets/common_exports.dart';
import 'package:my_protfolio/global_widgets/heading.dart';

import '../../assets.dart';

class MyselfPage extends StatelessWidget {
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
            title: 'My Self',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey.withOpacity(.5),
                  backgroundImage: AssetImage(Assets.owner),
                ),

                //details
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //greating
                        Text(
                          "Hello",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: TextStyles.fontSizeH1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        //about me
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            Data.aboutMe,
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                fontSize: TextStyles.fontSizeSmall,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF777777),
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),

                        //details
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Row(
                            children: [
                              //name
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    text: "Name:  ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Md. Khalid Hassan",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //location
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    text: "Location:  ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Dhaka,Bangladesh",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          children: [
                            //name
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  text: "Birthday:  ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "31 Novembor, 1997",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            //location
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  text: "Email:  ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "khalidhassan3011@gmail.com",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
