import 'package:cash_app/constant.dart';
import 'package:cash_app/features/auth/data/data_provider/local/my_config_cache.dart';
import 'package:cash_app/features/auth/data/data_provider/local/my_config_cache_keys.dart';
import 'package:cash_app/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:cash_app/features/auth/data/models/user_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  UserDataModel userDataModel = UserDataModel();

  /// Login Func
  Future<void> login(String phone, String password) async {
    emit(AuthLoadingState());
    await dioHelper.postData(endPoint: 'auth/login', body: {
      'phone': phone,
      'password': password,
    }).then((response) {
      userDataModel = UserDataModel.fromJson(response.data);

      MyConfigCach.putString(
          key: MyConfigCacheKeys.userId, value: response.data['user']['_id']);
      MyConfigCach.putString(
          key: MyConfigCacheKeys.roles, value: response.data['user']['role']);
      MyConfigCach.putString(
          key: MyConfigCacheKeys.myUserName,
          value: response.data['user']['username']);
      MyConfigCach.putInt(
          key: MyConfigCacheKeys.charge,
          value: response.data['user']['charge']);
      MyConfigCach.putInt(
          key: MyConfigCacheKeys.code, value: response.data['user']['code']);
      MyConfigCach.putString(
          key: MyConfigCacheKeys.token, value: response.data['token']);
      print('role is = ');
      print(response.data['user']['role']);
      print(MyConfigCach.getString(key: MyConfigCacheKeys.token));
      print(MyConfigCach.getString(key: MyConfigCacheKeys.roles));

      print(response);
      emit(AuthSuccessState());
    }).catchError((error) {
      print(error);
      emit(AuthErrorState());
    });
  }

  Future<void> signup(String phone, String password, String confirmPassword,
      String username) async {
    emit(SignupLoadingState());
    await dioHelper
        .postData(endPoint: 'auth/signup', body: {
      'phone': phone,
      'password': password,
      'confirmPassword': confirmPassword,
      'username': username,
    }).then((response) {
      print(response);
      emit(SignupSuccessState());
    }).catchError((error) {
      print(error);
      emit(SignupErrorState());
    });
  }
}
