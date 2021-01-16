import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ProtfolioController extends GetxController {
  var _selectedMenu = 0.obs;
  var isLightTheme = true.obs;

  var controller = AutoScrollController();

  get selectedMenu => this._selectedMenu.value;
  set selectedMenu(int index) {
    this._selectedMenu.value = index;
  }

  Future<void> scroll(int index) async {
    await controller.scrollToIndex(
      index,
      duration: Duration(milliseconds: 1000),
      preferPosition: AutoScrollPosition.begin,
    );
  }
}
