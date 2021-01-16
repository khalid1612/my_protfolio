import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_protfolio/global_widgets/common_exports.dart';

import 'local_widgets/menu_item.dart';

class Navbar extends PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.withOpacity(.2),
          ),
        ),
      ),
      child: Row(
        children: [
          //site title
          _siteTitle(),

          Spacer(),

          Obx(
            () => MenuItem(
                index: 0,
                selectedIndex: Get.find<ProtfolioController>().selectedMenu),
          ),

          Obx(
            () => MenuItem(
                index: 1,
                selectedIndex: Get.find<ProtfolioController>().selectedMenu),
          ),

          Obx(
            () => MenuItem(
                index: 2,
                selectedIndex: Get.find<ProtfolioController>().selectedMenu),
          ),

          Obx(
            () => MenuItem(
                index: 3,
                selectedIndex: Get.find<ProtfolioController>().selectedMenu),
          ),

          Obx(
            () => MenuItem(
                index: 4,
                selectedIndex: Get.find<ProtfolioController>().selectedMenu),
          ),

          Obx(
            () => MenuItem(
                index: 5,
                selectedIndex: Get.find<ProtfolioController>().selectedMenu),
          ),

          Obx(
            () => MenuItem(
                index: 6,
                selectedIndex: Get.find<ProtfolioController>().selectedMenu),
          ),

          Spacer(),

          // _theme(),
        ],
      ),
    );
  }

  Widget _siteTitle() => Text(
        "K",
        style: GoogleFonts.majorMonoDisplay(
          textStyle: TextStyle(
            fontSize: TextStyles.fontSizeH1,
          ),
        ),
      );

  Widget _theme() => InkWell(
        onTap: () {
          Get.find<ProtfolioController>().isLightTheme.value =
              !Get.find<ProtfolioController>().isLightTheme.value;
        },
        child: Obx(() {
          bool isLight = Get.find<ProtfolioController>().isLightTheme.value;
          return Icon(
            isLight ? FontAwesomeIcons.sun : FontAwesomeIcons.moon,
            color: isLight ? Colors.yellow : Colors.blue,
          );
        }),
      );
}
