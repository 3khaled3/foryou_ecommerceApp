import 'package:flutter/material.dart';

class ProfileButtoms extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const ProfileButtoms({super.key, 
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,

      ),
      child: 
        ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: Icon(
          icon,
          color: Colors.white,
        ),
      )
   
    ,
    );
  }
}