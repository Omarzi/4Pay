import 'package:bloc/bloc.dart';
import 'package:cash_app/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:cash_app/features/home_layout/data/user_profile_model.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  DioHelper dioHelper = DioHelper();

  ProfileModel profileModel = ProfileModel();

  Future<void> getUserProfile() async {
    emit(GetProfileDataLoadingState());
    await dioHelper.getData(endPoint: 'user/profile').then((response) {
      print(response.data);
      profileModel = ProfileModel.fromJson(response.data);
      emit(GetProfileDataSuccessState());
    }).catchError((error) {
      print('Error in Ge Profile Screen is $error');
      emit(GetProfileDataErrorState());
    });
  }
}
