import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troodking_app/env/environment.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/providers/functional_provider.dart';
import 'package:troodking_app/shared/routes/routes.dart';

void main() {

  String environment = const String.fromEnvironment('ENVIRONMENT', defaultValue: Environment.dev);

  WidgetsFlutterBinding.ensureInitialized();
  Environment().initConfig(environment);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appName = Environment().config!.appName;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FunctionalProvider())
      ],
      child: MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme().theme(),
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        onGenerateRoute: AppRoutes.onGenerateRoute
      ),
    );
  }
}

