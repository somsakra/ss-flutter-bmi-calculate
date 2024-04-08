import 'package:bmi_calculator/src/pages/home/home_page.dart';
import 'package:bmi_calculator/src/provider/theme_provider.dart';
import 'package:bmi_calculator/src/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
      builder: (context, child) {
        return MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: context.watch<ThemeProvider>().isDark
              ? ThemeMode.dark
              : ThemeMode.light,
          home: const HomePage(title: 'BMI CALCULATOR'),
        );
      },
    );
  }
}
