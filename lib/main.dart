import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/core/shared/di/app_modules.dart';
import '/categories/presentation/pages/categories_page.dart';
import '/core/shared/app_config.dart';
import '/core/shared/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = await getEnvironmentConfig();

  // initializes the registration of provided dependencies inside of [GetIt]
  await configureInjection(config);
  runApp(const ProviderScope(child: MyApp()));
}

/// Returns the environment config based on the environment variable
Future<AppConfig> getEnvironmentConfig() async {
  EnvironmentConstants envConstant;
  var dotEnvPath = '';
  const environment =
      String.fromEnvironment('FLUTTER_ENV', defaultValue: 'prod');

  switch (environment) {
    case 'prod':
    default:
      envConstant = EnvironmentConstants.production;
      dotEnvPath = '.env';
  }

  await dotenv.load(fileName: dotEnvPath);

  final config = AppConfig(
    env: envConstant,
    baseUrl: dotenv.env[EnvironmentApiKeys.baseUrl.value] ?? '',
  );

  return config;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _callUrlShortenerPage() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const CategoriesPage()),
            (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _callUrlShortenerPage());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
          ],
        ),
      ),
    );
  }
}
