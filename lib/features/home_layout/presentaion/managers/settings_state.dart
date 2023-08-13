part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

/// User Profile Data
class GetProfileDataLoadingState extends SettingsState {}

class GetProfileDataSuccessState extends SettingsState {}

class GetProfileDataErrorState extends SettingsState {}
