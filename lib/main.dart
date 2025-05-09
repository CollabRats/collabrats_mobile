import 'package:collabrats_mobile/base.dart';
import 'package:collabrats_mobile/presentation/chat/ui/chat_details_screen.dart';
import 'package:collabrats_mobile/presentation/chat/ui/chat_screen.dart';
import 'package:collabrats_mobile/presentation/discover/ui/discover_screen.dart';
import 'package:collabrats_mobile/presentation/post/bloc/add_package_cubit.dart';
import 'package:collabrats_mobile/presentation/post/bloc/add_project_cubit.dart';
import 'package:collabrats_mobile/presentation/post/bloc/add_ticket_cubit.dart';
import 'package:collabrats_mobile/presentation/post/ui/post_event_screen.dart';
import 'package:collabrats_mobile/presentation/post/ui/post_gig_screen.dart';
import 'package:collabrats_mobile/presentation/post/ui/post_job_screen.dart';
import 'package:collabrats_mobile/presentation/post/ui/post_screen.dart';
import 'package:collabrats_mobile/presentation/post/ui/post_service_screen.dart';
import 'package:collabrats_mobile/presentation/register/bloc/add_education_cubit.dart';
import 'package:collabrats_mobile/presentation/register/bloc/add_experience_cubit.dart';
import 'package:collabrats_mobile/presentation/register/ui/add_photo_video_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/dob_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/education_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/experience_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/gender_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/hobby_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/intention_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/location_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/looking_for_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/name_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/phone_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/signup_screen.dart';
import 'package:collabrats_mobile/presentation/register/ui/verification_screen.dart';
import 'package:collabrats_mobile/presentation/requests/ui/request_screen.dart';
import 'package:collabrats_mobile/presentation/splash/ui/splash_screen.dart';
import 'package:collabrats_mobile/services/http_services.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AddExperienceCubit()),
        BlocProvider(create: (_) => AddEducationCubit()),
        BlocProvider(create: (_) => AddPackageCubit()),
        BlocProvider(create: (_) => AddProjectCubit()),
        BlocProvider(create: (_) => AddTicketCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/signup': (context) => SignupScreen(),
          '/base': (context) => Base(),
          '/phone': (context) => PhoneScreen(),
          '/verify': (context) => VerificationScreen(),
          '/name': (context) => NameScreen(),
          '/dob': (context) => DobScreen(),
          '/location': (context) => LocationScreen(),
          '/gender': (context) => GenderScreen(),
          '/intention': (context) => IntentionScreen(),
          '/experience': (context) => ExperienceScreen(),
          '/education': (context) => EducationScreen(),
          '/lookingFor': (context) => LookingForScreen(),
          '/hobby': (context) => HobbyScreen(),
          '/photo': (context) => AddPhotoVideoScreen(),
          '/discover': (context) => DiscoverScreen(),
          '/post': (context) => PostScreen(),
          '/request': (context) => RequestScreen(),
          '/chat': (context) => ChatScreen(),
          '/chatDetails': (context) => ChatDetailsScreen(),
          '/postJob': (context) => PostJobScreen(),
          '/postGig': (context) => PostGigScreen(),
          '/postService': (context) => PostServiceScreen(),
          '/postEvent': (context) => PostEventScreen(),
        },
      ),
    );
  }
}
