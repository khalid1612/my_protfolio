import 'package:my_protfolio/global_widgets/common_exports.dart';

import 'pages/dashboard/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khalid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: ColorPalette.body,
        focusColor: ColorPalette.secondary,
      ),
      home: Dashboard(),
    );
  }
}
