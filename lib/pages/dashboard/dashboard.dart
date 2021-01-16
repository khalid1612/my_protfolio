import 'package:my_protfolio/global_widgets/common_exports.dart';
import 'package:my_protfolio/global_widgets/navbar/navbar.dart';
import 'package:my_protfolio/pages/contact/contact_page.dart';
import 'package:my_protfolio/pages/education/education_page.dart';
import 'package:my_protfolio/pages/experience/experience_page.dart';
import 'package:my_protfolio/pages/feedback/feedback_page.dart';
import 'package:my_protfolio/pages/home/home_page.dart';
import 'package:my_protfolio/pages/myselt/myself_page.dart';
import 'package:my_protfolio/pages/projects/project_page.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class Dashboard extends StatelessWidget {
  final ProtfolioController protfolioController =
      Get.put(ProtfolioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          controller: protfolioController.controller,
          children: [
            AutoScrollTag(
              key: ValueKey(0),
              controller: protfolioController.controller,
              index: 0,
              child: HomePage(),
            ),
            AutoScrollTag(
              key: ValueKey(1),
              controller: protfolioController.controller,
              index: 1,
              child: MyselfPage(),
            ),
            AutoScrollTag(
              key: ValueKey(2),
              controller: protfolioController.controller,
              index: 2,
              child: EducationPage(),
            ),
            AutoScrollTag(
              key: ValueKey(3),
              controller: protfolioController.controller,
              index: 3,
              child: ExperiencePage(),
            ),
            AutoScrollTag(
              key: ValueKey(4),
              controller: protfolioController.controller,
              index: 4,
              child: ProjectPage(),
            ),
            AutoScrollTag(
              key: ValueKey(5),
              controller: protfolioController.controller,
              index: 5,
              child: FeedbackPage(),
            ),
            AutoScrollTag(
              key: ValueKey(6),
              controller: protfolioController.controller,
              index: 6,
              child: ContactPage(),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
