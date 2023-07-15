// ignore_for_file: file_names
import 'package:flutter/material.dart';

class BuildTabBar extends StatefulWidget {
  const BuildTabBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BuildTabBarState createState() => _BuildTabBarState();
}

class _BuildTabBarState extends State<BuildTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: SizedBox(
            height: 35,
            child: TabBar(
              unselectedLabelColor: Colors.black,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black,
              ),
              controller: _tabController,
              tabs: const [
                Tab(
                  child: Text(
                    "Delivered",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Tab(
                  child: Text(
                    "Processing",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Tab(
                  child: Text(
                    "Cancelled",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Column(),
              Column(),
              Column(),
            ],
          ),
        ),
      ],
    );
  }
}
