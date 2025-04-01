import 'package:data_layer/data_layer.dart';
import 'package:data_layer/repository/animal_sale/animal_sale_api_client.dart';
import 'package:data_layer/repository/egg_harvest/egg_harvest_api_client.dart';
import 'package:data_layer/repository/healthy/healthy_api_client.dart';
import 'package:data_layer/repository/healthy/healthy_repository.dart';
import 'package:data_layer/repository/sale_type/sale_type_api_client.dart';
import 'package:data_layer/repository/symptom/symptom_api_client.dart';
import 'package:data_layer/repository/symptom/symptom_repository.dart';
import 'package:data_layer/repository/upload_image/upload_image_api_client.dart';
import 'package:data_layer/repository/vaccine_schedule/vaccine_schedule_api_client.dart';
import 'package:data_layer/repository/vaccine_schedule_log/vaccine_schedule_log_api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_farm/src/core/common/cubits/theme_cubit.dart';
import 'package:smart_farm/src/core/network/http_client.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/core/theme/theme.dart';
import 'package:smart_farm/src/core/theme/util.dart';
import 'package:smart_farm/src/viewmodel/animal_sale/animal_sale_cubit.dart';
import 'package:smart_farm/src/viewmodel/egg_harvest/egg_harvest_cubit.dart';
import 'package:smart_farm/src/viewmodel/farming_batch/farming_batch_cubit.dart';
import 'package:smart_farm/src/viewmodel/growth_stage/growth_stage_cubit.dart';
import 'package:smart_farm/src/viewmodel/healthy/healthy_cubit.dart';
import 'package:smart_farm/src/viewmodel/index.dart';
import 'package:smart_farm/src/viewmodel/medical_symptom/medical_symptom_cubit.dart';
import 'package:smart_farm/src/viewmodel/prescription/prescription_cubit.dart';
import 'package:smart_farm/src/viewmodel/sale_type/sale_type_cubit.dart';
import 'package:smart_farm/src/viewmodel/symptom/symptom_cubit.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';
import 'package:smart_farm/src/viewmodel/task/vaccine_schedule_log/vaccine_schedule_log_cubit.dart';
import 'package:smart_farm/src/viewmodel/task_qr_code/task_qr_code_cubit.dart';
import 'package:smart_farm/src/viewmodel/time/time_bloc.dart';
import 'package:smart_farm/src/viewmodel/upload_image/upload_image_cubit.dart';
import 'package:smart_farm/src/viewmodel/vaccine/vaccine_cubit.dart';
import 'package:smart_farm/src/viewmodel/vaccine_schedule/vaccine_schedule_cubit.dart';

/// The Widget that configures your application.
class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) =>
              AuthRepository(authApiClient: AuthApiClient(dio: dio)),
        ),
        RepositoryProvider(
          create: (context) =>
              TaskRepository(apiClient: TaskRemoteData(dio: dio)),
        ),
        RepositoryProvider(
          create: (context) =>
              CageRepository(cageApiClient: CageApiClient(dio: dio)),
        ),
        RepositoryProvider(
          create: (context) =>
              UserRepository(userApiClient: UserApiClient(dio: dio)),
        ),
        RepositoryProvider(
          create: (context) =>
              ReportRepository(reportApiClient: ReportApiClient(dio: dio)),
        ),
        RepositoryProvider(
            create: (context) =>
                HealthyRepository(apiClient: HealthyApiClient(dio: dio))),
        RepositoryProvider(create: (context) {
          return GrowthStageRepository(
              apiClient: GrowthStageApiClient(dio: dio));
        }),
        RepositoryProvider(create: (context) {
          return FarmingBatchRepository(
              apiClient: FarmingBatchApiClient(dio: dio));
        }),
        RepositoryProvider(create: (context) {
          return SymptomRepository(apiClient: SymptomApiClient(dio: dio));
        }),
        RepositoryProvider(create: (context) {
          return MedicalSymptomRepository(
              apiClient: MedicalSymptomApiClient(dio: dio));
        }),
        RepositoryProvider(create: (context) {
          return PrescriptionRepository(
              apiClient: PrescriptionApiClient(dio: dio));
        }),
        RepositoryProvider(
          create: (context) {
            return UserRepository(userApiClient: UserApiClient(dio: dio));
          },
        ),
        RepositoryProvider(create: (context) {
          return VaccineScheduleRepository(
              vaccineScheduleApiClient: VaccineScheduleApiClient(dio: dio));
        }),
        RepositoryProvider(create: (context) {
          return VaccineScheduleLogRepository(
              vaccineScheduleLogApiClient:
                  VaccineScheduleLogApiClient(dio: dio));
        }),
        RepositoryProvider(create: (context) {
          return AnimalSaleRepository(
              animalSaleApiClient: AnimalSaleApiClient(dio: dio));
        }),
        RepositoryProvider(create: (context) {
          return SaleTypeRepository(
              saleTypeApiClient: SaleTypeApiClient(dio: dio));
        }),
        RepositoryProvider(create: (context) {
          return EggHarvestRepository(apiClient: EggHarvestApiClient(dio: dio));
        }),
        RepositoryProvider(create: (context) {
          return UploadImageRepository(
              uploadImageApiClient: UploadImageApiClient(dio: Dio()));
        }),
        RepositoryProvider(
          create: (context) {
            return VaccineRepository(
                vaccineApiClient: VaccineApiClient(dio: dio));
          },
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(
              create: (context) => AuthBloc(
                    authRepository: context.read<AuthRepository>(),
                    userRepository: context.read<UserRepository>(),
                  )),
          BlocProvider(
              create: (context) =>
                  TaskBloc(repository: context.read<TaskRepository>())),
          BlocProvider(
              create: (context) =>
                  CageCubit(cageRepository: context.read<CageRepository>())),
          BlocProvider(
              create: (context) =>
                  UserBloc(userRepository: context.read<UserRepository>())),
          BlocProvider(
              create: (context) => ReportCubit(
                  reportRepository: context.read<ReportRepository>())),
          BlocProvider(
              create: (context) => HealthyCubit(
                  healthyRepository: context.read<HealthyRepository>())),
          BlocProvider(
              create: (context) => GrowthStageCubit(
                  growthStageRepository:
                      context.read<GrowthStageRepository>())),
          BlocProvider(
              create: (context) => FarmingBatchCubit(
                  repository: context.read<FarmingBatchRepository>())),
          BlocProvider(
              create: (context) => SymptomCubit(
                  symptomRepository: context.read<SymptomRepository>())),
          BlocProvider(
              create: (context) => MedicalSymptomCubit(
                  repository: context.read<MedicalSymptomRepository>(),
                  farmingBatchRepository:
                      context.read<FarmingBatchRepository>())),
          BlocProvider(
              create: (context) => PrescriptionCubit(
                  prescriptionRepository:
                      context.read<PrescriptionRepository>())),
          BlocProvider(
              create: (context) =>
                  TimeBloc(userRepository: context.read<UserRepository>())),
          BlocProvider(
            create: (context) => VaccineScheduleCubit(
                repository: context.read<VaccineScheduleRepository>()),
          ),
          BlocProvider(create: (context) {
            return VaccineScheduleLogCubit(
                repository: context.read<VaccineScheduleLogRepository>());
          }),
          BlocProvider(create: (context) {
            return AnimalSaleCubit(
                repository: context.read<AnimalSaleRepository>());
          }),
          BlocProvider(create: (context) {
            return SaleTypeCubit(
                repository: context.read<SaleTypeRepository>());
          }),
          BlocProvider(create: (context) {
            return EggHarvestCubit(
                repository: context.read<EggHarvestRepository>());
          }),
          BlocProvider(create: (context) {
            return UploadImageCubit(
                uploadImageRepository: context.read<UploadImageRepository>());
          }),
          BlocProvider(create: (context) {
            return TaskQrCodeCubit();
          }),
          BlocProvider(create: (context) {
            return VaccineCubit(
                vaccineRepository: context.read<VaccineRepository>());
          }),
        ],
        child: BlocBuilder<ThemeCubit, bool>(
          builder: (context, themeMode) {
            return MaterialApp.router(
              theme: themeMode == true ? theme.dark() : theme.light(),
              routerConfig: router,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}
