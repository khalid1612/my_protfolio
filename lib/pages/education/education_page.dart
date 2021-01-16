import 'package:google_fonts/google_fonts.dart';
import 'package:my_protfolio/data/data.dart';
import 'package:my_protfolio/global_widgets/common_exports.dart';
import 'package:my_protfolio/global_widgets/heading.dart';

class EducationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 150.0),
      // color: Colors.grey.withOpacity(.7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Heading(
            title: 'Education',
          ),

          //educatio details
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _degree(
                "2016",
                "2021",
                "Undergraduate Degree",
                Data.bscDetails,
              ),
              _degree(
                "2012",
                "2014",
                "Higher Secondary Certificate",
                Data.hscDetails,
              ),
              _degree(
                "2010",
                "2012",
                "Secondary School Certificate",
                Data.sscDetails,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _degree(
    String start,
    String end,
    String name,
    String details,
  ) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //start end
          Text(
            "$start - $end",
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontSize: TextStyles.fontSizeSmall,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          //design
          Column(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.green),
                ),
              ),
              Container(
                width: 2,
                height: 100,
                color: Colors.blue,
                margin: EdgeInsets.symmetric(horizontal: 40),
              ),
            ],
          ),

          //degree name
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: TextStyles.fontSizeH3,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                //degree details
                Text(
                  details,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      fontSize: TextStyles.fontSizeSmall,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
