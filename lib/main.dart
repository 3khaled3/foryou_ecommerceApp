import 'package:flutter/material.dart';
import 'package:foryou/core/utils/routes.dart';
import 'package:foryou/features/MyOrders/presentation/MyOrders_view.dart';
import 'package:foryou/features/Product/presentation/widget/productImage.dart';
import 'package:foryou/features/Settings/presentation/Settings_view.dart';
import 'package:foryou/features/login/presentation/login_view.dart';
import 'package:foryou/features/main/presentation/MainView.dart';
import 'package:foryou/features/register/presentation/register_view.dart';
import 'package:foryou/mmmmmm.dart';

import 'features/Bag/presentation/Bag_view.dart';
import 'features/Categories/presentation/categories_view.dart';
import 'features/CategoriesFind/presentation/categoriesFind_view.dart';
import 'features/Favorite/presentation/Favorite_view.dart';
import 'features/Product/presentation/product_view.dart';
import 'features/forgetpssword/presentation/forgetpass_view.dart';
import 'features/home/presentation/home_view.dart';

void main()
{
  runApp(MaterialApp.router(routerConfig: AppRouter.router,debugShowCheckedModeBanner: false,
    // home: MainView(),
    
    // home: CarouselWithIndicatorDemo(),
  ));
}