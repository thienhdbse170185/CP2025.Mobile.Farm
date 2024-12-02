import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/model/destination.dart';

class LayoutScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const LayoutScaffold({required this.navigationShell, Key? key})
      : super(key: key ?? const ValueKey<String>('LayoutScaffold'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
          elevation: 5,
          backgroundColor: const Color(0xFFFFFFFF),
          height: MediaQuery.of(context).size.height * 0.08,
          destinations: destinations
              .map((destination) => NavigationDestination(
                    icon: Icon(destination.icon),
                    label: destination.label,
                    selectedIcon: Icon(
                      destination.iconSelected,
                      color: Theme.of(context).primaryColor,
                    ),
                  ))
              .toList(),
        ));
  }
}
