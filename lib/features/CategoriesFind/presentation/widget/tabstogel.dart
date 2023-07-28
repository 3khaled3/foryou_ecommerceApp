import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/utils/routes.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/Cubits/Apicubit/api_cubit.dart';

class tabstogel extends StatelessWidget {
  final int initial;
  const tabstogel({
    required this.initial,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late TabController _tabController;
    List categorieslist = BlocProvider.of<ApiCubit>(context).categories;
    List<Widget> taps = [];
    taps.add(const Tab(
      child: Tap(tap: "All"),
    ));
    for (var i = 0; i < categorieslist.length; i++) {
      taps.add(Tab(
        child: Tap(tap: categorieslist[i]),
      ));
    }

    _tabController = TabController(
      length: taps.length,
      initialIndex: initial,
      vsync: Scaffold.of(context),
    );
    return DefaultTabController(
      length: taps.length,
      child: Column(
        children: <Widget>[
          SafeArea(
            child: ButtonsTabBar(
                controller: _tabController,
                radius: 100,
                onTap: (value) {
                  GoRouter.of(context).pop();
                  if (value==0) {
                     GoRouter.of(context).push(AppRouter.kallproductsView,
                      extra: "All");
                  }else {
                    GoRouter.of(context).push(AppRouter.kallproductsView,
                      extra: categorieslist[(value - 1)]);
                  }
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
                tabs: taps),
          ),
        ],
      ),
    );
  }
}

class Tap extends StatelessWidget {
  final String tap;
  const Tap({
    required this.tap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
          child: Text(
        tap,
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
      )),
    );
  }
}
