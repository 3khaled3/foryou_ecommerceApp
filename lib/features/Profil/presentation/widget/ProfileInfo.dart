// ignore_for_file: file_names
import 'package:flutter/material.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
              radius: 50, backgroundImage: AssetImage("assets/styles/3.jpg")),
          SizedBox(height: 16),
          Text(
            "Khaled Tarek",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          SizedBox(height: 8),
          Text("dev.khaledtarek@gmail.com",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
