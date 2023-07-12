import 'package:flutter/material.dart';
import 'package:foryou/features/login/presentation/login_view.dart';
import 'package:foryou/features/register/presentation/register_view.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    home: loginView(),
    // home: registerView(),
  ));
}