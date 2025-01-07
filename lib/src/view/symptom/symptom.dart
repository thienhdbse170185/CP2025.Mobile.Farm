import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/viewmodel/medical_symptom/medical_symptom_cubit.dart';

class SymptomWidget extends StatefulWidget {
  const SymptomWidget({super.key});

  @override
  State<SymptomWidget> createState() => _SymptomWidgetState();
}

class _SymptomWidgetState extends State<SymptomWidget> {
  @override
  void initState() {
    super.initState();
    context.read<MedicalSymptomCubit>().getMedicalSymptomsByBatch(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: const Text('Báo cáo triệu chứng'),
        leading: IconButton(
          icon: LinearIcons.arrowBackIcon,
          onPressed: () {
            context.pop();
          },
        ),
        appBarHeight: MediaQuery.of(context).size.height * 0.07,
      ),
      body: Center(
        child: Text('List symptom screen'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push(RouteName.createSymptom, extra: {
            'cageName': '',
          });
        },
        icon: LinearIcons.addCircleIcon,
        label: const Text('Báo bệnh'),
      ),
    );
  }
}
