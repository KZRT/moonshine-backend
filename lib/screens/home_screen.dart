import 'package:flutter/material.dart';
import 'package:moonshine_fe/screens/recipe_tab_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
      animationDuration: Duration.zero,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.wine_bar_outlined),
                  Text(
                    'MoonShine',
                    // style: TextStyle(
                    //     // fontWeight: FontWeight.bold,
                    //     ),
                  ),
                ],
              ),
              backgroundColor: Colors.black87,
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                tabs: const <Tab>[
                  Tab(
                    text: '#Map',
                    // icon: Icon(Icons.map_outlined),
                  ),
                  Tab(
                    text: '#Blog',
                    // icon: Icon(Icons.comment_bank_outlined),
                  ),
                  Tab(
                    text: '#Recipe',
                    // icon: Icon(Icons.wine_bar_outlined),
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            const Text('Map Page'),
            const Text('Blog Page'),
            RecipeTabScreen(),
          ],
        ),
      ),
    );
  }
}
