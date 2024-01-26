import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/ui_kit/generated_theme/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DbroInitial extends StatelessWidget {
  const DbroInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (ctx1, orientation, screenType) {
      return ResponsiveApp(builder: (ctx2) {
        return MaterialApp.router(
          routerConfig: AppRouter.nav.config(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: FontFamily.hKGoretsk),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ja'),
            Locale('id'),
          ],
        ).animate().fadeIn(
              delay: const Duration(milliseconds: 50),
              duration: const Duration(milliseconds: 400),
            );
      });
    });
  }
}
