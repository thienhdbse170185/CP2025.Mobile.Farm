part of 'animal_sale_cubit.dart';

@freezed
class AnimalSaleState with _$AnimalSaleState {
  const factory AnimalSaleState.initial() = _Initial;

  const factory AnimalSaleState.createAnimalSaleInProgress() = _Loading;
  const factory AnimalSaleState.createAnimalSaleSuccess() = _Success;
  const factory AnimalSaleState.createAnimalSaleFailure(String error) =
      _Failure;
}
