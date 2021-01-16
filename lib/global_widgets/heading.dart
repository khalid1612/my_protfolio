import 'package:google_fonts/google_fonts.dart';
import 'package:my_protfolio/global_widgets/common_exports.dart';

class Heading extends StatelessWidget {
  final String title;

  const Heading({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 80.0,
        bottom: 80,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: TextStyles.fontSizeH1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            width: 20,
            height: 5,
            decoration: BoxDecoration(
              color: ColorPalette.secondary,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
