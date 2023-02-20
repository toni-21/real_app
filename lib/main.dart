import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_app/providers/app_provider.dart';
import 'package:real_app/providers/auth_provider.dart';
import 'package:real_app/view/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _appProvider = AppProvider();
  final _authProvider = AuthProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => _appProvider),
        ChangeNotifierProvider(create: (BuildContext context) => _authProvider),
      ],
      child: Consumer<AppProvider>(builder: (context, appProvider, child) {
        return MaterialApp(
          title: 'Spin Beaz',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
