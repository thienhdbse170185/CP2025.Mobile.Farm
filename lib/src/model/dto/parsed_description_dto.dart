class ParsedDescriptionDto {
  final int numberOfAnimals;
  final List<Medication> medications;

  ParsedDescriptionDto({
    required this.numberOfAnimals,
    required this.medications,
  });
}

class Medication {
  final String name;
  final int dose;

  Medication({
    required this.name,
    required this.dose,
  });
}
