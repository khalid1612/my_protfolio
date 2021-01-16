import 'package:my_protfolio/data/data.dart';
import 'package:my_protfolio/global_widgets/common_exports.dart';

class MenuItem extends StatelessWidget {
  final int index;
  final int selectedIndex;

  const MenuItem({
    Key key,
    @required this.index,
    @required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = index == selectedIndex ? true : false;

    return InkWell(
      onTap: () {
        Get.find<ProtfolioController>().selectedMenu = index;
        Get.find<ProtfolioController>().scroll(index);
      },
      borderRadius: BorderRadius.circular(18),
      child: Container(
        margin: const EdgeInsets.only(right: 5.0),
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        decoration: BoxDecoration(
          color: isSelected ? ColorPalette.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Data.menuIcon[index],
                  size: 16,
                  color: Colors.white,
                ),
              ),
            Text(
              Data.menuItem[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
