import 'package:flutter/material.dart';
import 'package:foryou/features/login/presentation/login_view.dart';
import 'package:foryou/features/register/presentation/register_view.dart';

import 'features/Categories/presentation/categories_view.dart';
import 'features/forgetpssword/presentation/forgetpass_view.dart';
import 'features/home/presentation/home_view.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    // home: loginView(),
    home: CategoriesView(),
  ));
}