import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/utils/Cubits/cubit/user_cubit.dart';
import 'package:foryou/core/utils/routes.dart';
import 'package:hive/hive.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Hive.openBox('myBox');
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  cameras = await availableCameras();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => UserCubit(),
      ),
    ],
    child: MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    ),
  ));
}
