part of 'air_charge_cubit.dart';

@immutable
abstract class AirChargeState {}

class AirChargeInitialState extends AirChargeState {}

/// Vodafone
class AirChargeVodafoneLoadingState extends AirChargeState {}

class AirChargeVodafoneSuccessState extends AirChargeState {}

class AirChargeVodafoneErrorState extends AirChargeState {}

/// We
class AirChargeWeLoadingState extends AirChargeState {}

class AirChargeWeSuccessState extends AirChargeState {}

class AirChargeWeErrorState extends AirChargeState {}

/// Etisalat
class AirChargeEtisalatLoadingState extends AirChargeState {}

class AirChargeEtisalatSuccessState extends AirChargeState {}

class AirChargeEtisalatErrorState extends AirChargeState {}

/// Orange
class AirChargeOrangeLoadingState extends AirChargeState {}

class AirChargeOrangeSuccessState extends AirChargeState {}

class AirChargeOrangeErrorState extends AirChargeState {}

/// Send Charge
class SendChargeLoadingState extends AirChargeState {}

class SendChargeSuccessState extends AirChargeState {}

class SendChargeErrorState extends AirChargeState {}
