import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stettlerproapp/screens/login.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 250, 250, 250),
  fontFamily: GoogleFonts.poppins().fontFamily,
  useMaterial3: true,
);

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
