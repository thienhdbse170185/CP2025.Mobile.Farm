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
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    );
              }
              return Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  );
            },
          ),
        ),
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
          indicatorColor: Theme.of(context).colorScheme.primaryContainer,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
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
        ),
      ),
    );
  }
}
