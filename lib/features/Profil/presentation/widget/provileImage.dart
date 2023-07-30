// ignore_for_file: file_names, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/utils/Cubits/userCubit/user_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/widget/SnakePar.dart';

buildProfileImage() {
  return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
    return state is Waitting
        ? Center(
            child: CircleAvatar(
            backgroundColor: const Color.fromARGB(0, 244, 67, 54),
            child: Center(
                child: SizedBox(
                     height: MediaQuery.sizeOf(context).height * .17,
              width: MediaQuery.sizeOf(context).height * .17,
                    child: CircleAvatar(backgroundColor: const Color.fromARGB(0, 255, 193, 7),
                      child: Lottie.asset(
                        "assets/loadingimage.json",
                      ),
                    ))),
          ))
        : SizedBox(
          height: MediaQuery.sizeOf(context).height * .17,
          width: MediaQuery.sizeOf(context).height * .17,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              CircleAvatar(
                backgroundImage:
                    FirebaseAuth.instance.currentUser!.photoURL == null
                        ? const AssetImage("assets/new.png")
                        : CachedNetworkImageProvider(FirebaseAuth
                            .instance
                            .currentUser!
                            .photoURL!) as ImageProvider<Object>,
                child: ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: const Color.fromARGB(0, 24, 62, 54),
                    padding: EdgeInsets.zero,
                    elevation: 2.0,
                  ),
                  child: Container(),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: RawMaterialButton(
                    onPressed: () async {
                      await BlocProvider.of<UserCubit>(context)
                          .updateProfilePhoto();
                      final state =
                          BlocProvider.of<UserCubit>(context).state;
                      if (state is Success) {
                        showToastMessage(
                          "Success",
                          Colors.green,
                        );
                      } else if (state is Error) {
                        final errorMessage = (state).errorMessage;
                        print("11111111111111$errorMessage");
                        showToastMessage(errorMessage, Colors.red);
                      }
                    },
                    elevation: 2.0,
                    fillColor: Colors.red[900],
                    padding: EdgeInsets.zero,
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.camera_alt_sharp,
                      size: 22,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  });
}
