// import 'package:auto_route/auto_route.dart';
// import 'package:elvan/features/home/screens/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class TestBottomTabsRoute extends ConsumerWidget {
//   const TestBottomTabsRoute({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AutoTabsRouter(
//       routes: const [
//         HomeScreen(),
//         Child2Tab(),
//       ],
//       builder: (context, child, animation) {
//         final tabsRouter = AutoTabsRouter.of(context);
//         return Scaffold(
//           body: FadeTransition(
//             opacity: animation,
//             child: child,
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: tabsRouter.activeIndex,
//             onTap: (index) {
//               tabsRouter.setActiveIndex(index);
//             },
//             items: [
//               BottomNavigationBarItem(label: 'Users', icon: Icon(Icons.dry)),
//               BottomNavigationBarItem(label: 'Posts', icon: Icon(Icons.duo)),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
