import 'package:google_fonts/google_fonts.dart';
import 'package:my_protfolio/global_widgets/common_exports.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onTap;

  const Button({
    Key key,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: TextStyles.fontSizeNormal,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
