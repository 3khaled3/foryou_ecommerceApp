
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class tabstogel extends StatelessWidget {
  const tabstogel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 10,
        child: Column(
          children: <Widget>[
     SafeArea(
       child: ButtonsTabBar(
         radius: 100,
         onTap: (value) {
           print(value);
         },
         backgroundColor: Colors.red,
         unselectedBackgroundColor: Colors.black,
         unselectedLabelStyle: const TextStyle(
             color: Colors.white,
             fontSize: 14,
             fontWeight: FontWeight.w500),
         labelStyle: const TextStyle(
             color: Colors.black,
             fontSize: 14,
             fontWeight: FontWeight.w500),
         tabs: const [
           Tab(
             child: SizedBox(
                 width: 100,
                 child: Center(
                     child: Text(
                   "New",
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 14,
                       fontWeight: FontWeight.w500),
                 ))),
           ),
           Tab(
             child: SizedBox(
                 width: 100,
                 child: Center(
                     child: Text(
                   "New",
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 14,
                       fontWeight: FontWeight.w500),
                 ))),
           ),
           Tab(
             child: SizedBox(
                 width: 100,
                 child: Center(
                     child: Text(
                   "New",
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 14,
                       fontWeight: FontWeight.w500),
                 ))),
           ),
           Tab(
             child: SizedBox(
                 width: 100,
                 child: Center(
                     child: Text(
                   "New",
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 14,
                       fontWeight: FontWeight.w500),
                 ))),
           ),
           Tab(
             child: SizedBox(
                 width: 100,
                 child: Center(
                     child: Text(
                   "New",
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 14,
                       fontWeight: FontWeight.w500),
                 ))),
           ),
           Tab(
             child: SizedBox(
                 width: 100,
                 child: Center(
                     child: Text(
                   "New",
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 14,
                       fontWeight: FontWeight.w500),
                 ))),
           ),
           Tab(
             child: SizedBox(
                 width: 100,
                 child: Center(
                     child: Text(
                   "New",
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 14,
                       fontWeight: FontWeight.w500),
                 ))),
           ),
           Tab(
             child: SizedBox(
                 width: 100,
                 child: Center(
                     child: Text(
                   "New",
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 14,
                       fontWeight: FontWeight.w500),
                 ))),
           ),
           Tab(
             child: SizedBox(
                 width: 100,
                 child: Center(
                     child: Text(
                   "New",
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 14,
                       fontWeight: FontWeight.w500),
                 ))),
           ),
           Tab(
             child: SizedBox(
                 width: 100,
                 child: Center(
                     child: Text(
                   "New",
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 14,
                       fontWeight: FontWeight.w500),
                 ))),
           ),
         ],
       ),
     ),
          ],
        ),
      );
  }
}

