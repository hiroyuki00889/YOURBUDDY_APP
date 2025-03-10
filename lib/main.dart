import 'package:flutter/material.dart';
import 'package:test_flutter4/presentation/screens/auth/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/router.dart';
import 'logic/providers/auth_provider.dart';
import 'logic/providers/chat_provider.dart';

void main() async {
  // Initialize Hive for local storage
  await Hive.initFlutter();

  // Open Hive boxes for storing data
  await Hive.openBox('authBox');
  await Hive.openBox('chatBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp.router(
        title: 'YOURBUDDY',
        theme: ThemeData(
          primaryColor: Colors.green,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.yellowAccent[100],
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }
}



