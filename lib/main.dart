import 'package:present_app/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyTest(appRouter: AppRouter()));
}

class MyTest extends StatelessWidget {
  // This widget is the root of your application.
  final AppRouter appRouter;
  const MyTest({Key key, @required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRouter,
    );
  }
}
