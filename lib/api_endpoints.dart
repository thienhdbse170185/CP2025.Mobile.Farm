class ApiEndpoints {
  // TEST CONNECT
  static const String testConnectAPI = '/tasks/testconnect';

  // AUTH
  static const String login = '/auth/login';

  // TASK
  static const String getTasks = '/tasks';
  static const String getNextTask = '/tasks/next-task';

  // LOG
  static const String dailyFoodUsageLog = '/dailyfoodusagelog';
  static const String healthLog = '/healthlog';

  // CAGE
  static const String getCages = '/cages';

  // MEDICAL SYMPTOM
  static const String postSymptom = '/medicalsymptom';
  static const String getSymptoms = '/medicalsymptom';
  static const String getMedicalSymptomsByBatch =
      '$getSymptoms/by-staff-and-batch';

  // USER
  static const String getUsers = '/users';
  static const String postUser = '/users';
  static const String getServerTime = '/users/server-time';

  // GROWTHSTAGE
  static const String growthStage = '/growthstage';
  static const String growthStageInCage = '$growthStage/cage';
  static const String growthStageUpdateWeight =
      '$growthStage/growth-stage/update-weight';

  // FARMING-BATCH
  static const String farmingBatch = '/farmingbatchs';
  static const String farmingBatchByCage = '$farmingBatch/cage';

  // SYMPTOM
  static const String symptom = '/symptom';

  // PRESCRIPTION
  static const String prescription = '/prescription';

  // VACCINE SCHEDULE
  static const String vaccineSchedule = '/vaccineschedule';

  // VACCINE SCHEDULE LOG
  static const String vaccineScheduleLog = '/vaccineschedulelog';

  // VACCINE
  static const String vaccine = '/vaccine';

  // ANIMAL SALE
  static const String animalSale = '/animalsale';

  // SALE TYPES
  static const String saleType = '/saletypes';

  // EGG HARVEST
  static const String eggHarvest = '/eggharvest';

  // UPLOAD IMAGE
  static const String imageUpload =
      'https://imageservice.fjourney.site/api/images';
}
