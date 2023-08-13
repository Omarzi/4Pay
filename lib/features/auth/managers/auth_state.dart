part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {}

/// Login
class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthErrorState extends AuthState {}

/// Signup
class SignupLoadingState extends AuthState {}

class SignupSuccessState extends AuthState {}

class SignupErrorState extends AuthState {}