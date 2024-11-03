import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'ClothesListPage.dart';

void main() {
  runApp(const MyApp());
}

ColorScheme defaultColorScheme = const ColorScheme(
  primary: Color(0xffBB86FC),
  secondary: Color(0xff03DAC6),
  surface: Color(0xff181818),
  background: Color(0xff808080),
  error: Color(0xffCF6679),
  onPrimary: Color(0xff000000),
  onSecondary: Color(0xff000000),
  onSurface: Color(0xffffffff),
  onBackground: Color(0xffffffff),
  onError: Color(0xff000000),
  brightness: Brightness.dark,
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: defaultColorScheme,
        scaffoldBackgroundColor: defaultColorScheme.background,
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(
          color: defaultColorScheme.primary,
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: defaultColorScheme.onPrimary,
          ),
          backgroundColor: defaultColorScheme.primary,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: defaultColorScheme.surface,
          selectedItemColor: defaultColorScheme.primary,
          unselectedItemColor: defaultColorScheme.onSurface,
        ),
      ),
      home: const LoginPage(title: 'Login UI'),
    );
  }
}
