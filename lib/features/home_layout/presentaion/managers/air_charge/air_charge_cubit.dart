import 'package:bloc/bloc.dart';
import 'package:cash_app/constant.dart';
import 'package:cash_app/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'air_charge_state.dart';

class AirChargeCubit extends Cubit<AirChargeState> {
  AirChargeCubit() : super(AirChargeInitialState());

  static AirChargeCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  dynamic charge = 0;

  /// Vodafone
  Future<void> airChargeVodafone(int amount, String number) async {
    emit(AirChargeVodafoneLoadingState());
    await dioHelper.postData(endPoint: 'user/air_change?type=vodafone', body: {
      'amount': amount,
      'number': number,
    }).then((response) {
      print(response.data);
      emit(AirChargeVodafoneSuccessState());
    }).catchError((error) {
      print('Error in Vodafone $error');
      emit(AirChargeVodafoneErrorState());
    });
  }

  /// Etisalat
  Future<void> airChargeEtisalt(int amount, String number) async {
    emit(AirChargeEtisalatLoadingState());
    await dioHelper.postData(endPoint: 'user/air_change?type=etislat', body: {
      'amount': amount,
      'number': number,
    }).then((response) {
      print(response.data);
      emit(AirChargeEtisalatSuccessState());
    }).catchError((error) {
      print('Error in Etisalt $error');
      emit(AirChargeEtisalatErrorState());
    });
  }

  /// We
  Future<void> airChargeWe(int amount, String number) async {
    emit(AirChargeWeLoadingState());
    await dioHelper.postData(endPoint: 'user/air_change?type=we', body: {
      'amount': amount,
      'number': number,
    }).then((response) {
      print(response.data);
      emit(AirChargeWeSuccessState());
    }).catchError((error) {
      print('Error in We $error');
      emit(AirChargeWeErrorState());
    });
  }

  /// Orange
  Future<void> airChargeOrange(int amount, String number) async {
    emit(AirChargeOrangeLoadingState());
    await dioHelper.postData(endPoint: 'user/air_change?type=orange', body: {
      'amount': amount,
      'number': number,
    }).then((response) {
      print(response.data);
      emit(AirChargeOrangeSuccessState());
    }).catchError((error) {
      print('Error in We $error');
      emit(AirChargeOrangeErrorState());
    });
  }

  /// Send Charge
  Future<void> sendCharge() async {
    emit(SendChargeLoadingState());
    await dioHelper.getData(endPoint: 'user/charge').then((response) {
      print(response.data);
      charge = response.data['charge'];
      emit(SendChargeSuccessState());
    }).catchError((error) {
      print('Error in Send Charge is $error');
      emit(SendChargeErrorState());
    });
  }
}
