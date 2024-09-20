import 'package:bookly/core/routing/app_router.dart';
import 'package:bookly/core/routing/routes.dart';
import 'package:bookly/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooklyApp extends StatelessWidget {
  final AppRouter appRouter;
  const BooklyApp({super.key,required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorsManager.kPrimaryColor
        ),
        initialRoute: Routes.splashScreen,
        onGenerateRoute: appRouter.generateRoute,
      )
    );
  }
}