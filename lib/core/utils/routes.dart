
import 'package:foryou/features/forgetpssword/presentation/forgetpass_view.dart';
import 'package:foryou/features/login/presentation/login_view.dart';
import 'package:foryou/features/main/presentation/MainView.dart';
import 'package:go_router/go_router.dart';

import '../../features/register/presentation/register_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kloginview = '/loginView';
  static const kforgetPssView = '/forgetPssView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const registerView(),
      ),
      GoRoute(
        path: kloginview,
        builder: (context, state) => const loginView(),
      ),
      GoRoute(
        path: kforgetPssView,
        builder: (context, state) => const forgetPssView(),
      ),
     
    ],
  );
}