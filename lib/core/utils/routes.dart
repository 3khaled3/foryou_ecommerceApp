import 'package:foryou/features/Product/presentation/product_view.dart';
import 'package:foryou/features/forgetpssword/presentation/forgetpass_view.dart';
import 'package:foryou/features/home/data/product.dart';
import 'package:foryou/features/login/presentation/login_view.dart';
import 'package:foryou/features/main/presentation/MainView.dart';
import 'package:go_router/go_router.dart';

import '../../features/CategoriesFind/presentation/categoriesFind_view.dart';
import '../../features/register/presentation/register_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kloginview = '/loginView';
  static const kforgetPssView = '/forgetPssView';
  static const kproductView = '/productView';
static const kallproductsView='/productsView';
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
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: kproductView,
        builder: (context, state) {
          Product product = state.extra as Product;
          return productView(product: product);
        },
      ),
      GoRoute(
        path: kallproductsView,
        builder: (context, state) {
          String product = state.extra as String;
          return CategoriesFindView(Categorie: product);
        },
      ),
    ],
  );
}
