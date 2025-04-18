import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/model/destination.dart';
import 'package:smart_farm/src/view/symptom/cage_option.dart';
import 'package:smart_farm/src/view/widgets/qr_scanner.dart';
import 'package:smart_farm/src/viewmodel/cage/cage_cubit.dart';

class LayoutScaffold extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const LayoutScaffold({required this.navigationShell, Key? key})
      : super(key: key ?? const ValueKey<String>('LayoutScaffold'));

  @override
  State<LayoutScaffold> createState() => _LayoutScaffoldState();
}

class _LayoutScaffoldState extends State<LayoutScaffold> {
  final List<CageOption> _cages = [];

  @override
  void initState() {
    super.initState();
    context.read<CageCubit>().getCagesByUserId();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CageCubit, CageState>(
      listener: (context, state) {
        state.maybeWhen(
          loadByUserIdInProgress: () {},
          loadByUserIdSuccess: (response) {
            _cages.clear();
            response.map((cage) {
              _cages.add(CageOption(id: cage.id, name: cage.name));
            }).toList();
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: _getSelectedIndex(),
          onDestinationSelected: (index) {
            if (destinations[index].isQrButton) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => QRScannerWidget(
                    title: 'Quét mã QR chuồng',
                    instruction: 'Đặt mã QR vào khung hình để quét',
                    helperText: 'Mã QR được dán trên chuồng',
                    onScanned: (String qrCode) {
                      log("QR Code: $qrCode");
                      final cage = _cages.firstWhere(
                        (cage) => cage.id == qrCode.toLowerCase(),
                        orElse: () => CageOption(id: '', name: ''),
                      );

                      if (cage.id.isNotEmpty) {
                        context.go(RouteName.taskQRCode, extra: cage);
                      } else {
                        throw Exception(
                            'Không tìm thấy thông tin chuồng, \nvui lòng thử lại.');
                      }
                    },
                  ),
                ),
              );
            } else {
              final adjustedIndex = index > 2 ? index - 1 : index;
              widget.navigationShell.goBranch(adjustedIndex);
            }
          },
          elevation: 5,
          backgroundColor: const Color(0xFFFFFFFF),
          height: MediaQuery.of(context).size.height * 0.08,
          destinations: destinations.map((destination) {
            if (destination.isQrButton) {
              return NavigationDestination(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.qr_code_scanner,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                label: destination.label,
              );
            }
            return NavigationDestination(
              icon: Icon(destination.icon),
              label: destination.label,
              selectedIcon: Icon(
                destination.iconSelected,
                color: Theme.of(context).primaryColor,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  int _getSelectedIndex() {
    final currentIndex = widget.navigationShell.currentIndex;
    return currentIndex >= 2 ? currentIndex + 1 : currentIndex;
  }
}
