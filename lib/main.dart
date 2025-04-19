import 'package:collabrats_mobile/presentation/register/ui/dob_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/experience_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/gender_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/intention_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/location_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/name_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/phone_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/verification_screen.dart';
import 'package:collabrats_mobile/presentation/splash/ui/splash_screen.dart';
import 'package:collabrats_mobile/services/http_services.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await _registerServices();
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['ANON_KEY']!,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(MyApp()));
}

Future<void> _registerServices() async {
  GetIt.instance.registerSingleton<HttpService>(HttpService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/phone': (context) => PhoneScreen(),
        '/verify': (context) => VerificationScreen(),
        '/name': (context) => NameScreen(),
        '/dob': (context) => DobScreen(),
        '/location': (context) => LocationScreen(),
        '/gender': (context) => GenderScreen(),
        '/intention': (context) => IntentionScreen(),
        '/experience': (context) => ExperienceScreen(),
      },
    );
  }
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
