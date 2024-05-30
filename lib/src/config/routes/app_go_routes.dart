import 'package:essay_projects/src/config/routes/route_name.dart';
import 'package:essay_projects/src/features/addProject/addproject.dart';
import 'package:essay_projects/src/features/chat/chat_screen.dart';
import 'package:essay_projects/src/features/developer_profile/developer_profile.dart';
import 'package:essay_projects/src/features/error/error_screen.dart';
import 'package:essay_projects/src/features/home/home.dart';
import 'package:essay_projects/src/features/marketplace/project_detail_screen.dart';
import 'package:essay_projects/src/features/onboarding/onboarding.dart';
import 'package:essay_projects/src/features/project_preview/project_preview.dart';
import 'package:essay_projects/src/features/project_preview/widgets/project_status_details.dart';
import 'package:essay_projects/src/features/user_profile/add_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._privateConstructor();
  static AppRouter? _instance;
  factory AppRouter() => _instance ??= AppRouter._privateConstructor();

  final router = GoRouter(
    initialLocation: AppRouteNames.home,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRouteNames.onBoarding,
        pageBuilder: (context, state) => const MaterialPage(
          child: OnBoarding(),
        ),
      ),
      GoRoute(
        path: AppRouteNames.home,
        pageBuilder: (context, state) => const MaterialPage(
          child: MyHomePage(),
        ),
      ),
      GoRoute(
        path: AppRouteNames.addProject,
        pageBuilder: (context, state) => const MaterialPage(
          child: AddYourProject(),
        ),
      ),
      GoRoute(
        path: AppRouteNames.marketProjectDetails,
        pageBuilder: (context, state) => const MaterialPage(
          child: MarketProjectDetailsScreen(),
        ),
      ),
      GoRoute(
        path: AppRouteNames.chat,
        pageBuilder: (context, state) => const MaterialPage(
          child: ChatScreen(),
        ),
      ),
      GoRoute(
        path: AppRouteNames.projectWorkStatus,
        pageBuilder: (context, state) => const MaterialPage(
          child: ProjectWorkStatus(),
        ),
      ),
      GoRoute(
        path: AppRouteNames.developerProfile,
        pageBuilder: (context, state) => const MaterialPage(
          child: DeveloperProfile(),
        ),
      ),
      GoRoute(
        path: AppRouteNames.addProfile,
        pageBuilder: (context, state) => const MaterialPage(
          child: AddProfileDetails(),
        ),
      ),
      GoRoute(
          path: AppRouteNames.projectPreview,
          pageBuilder: (context, state) {
            bool? isProfileView =
                state.extra != null ? state.extra as bool : false;
            return MaterialPage(
              child: ProjectPreview(
                isProfileView: isProfileView,
              ),
            );
          }),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: ErrorScreen(
        e: state.error,
      ),
    ),
  );
}
