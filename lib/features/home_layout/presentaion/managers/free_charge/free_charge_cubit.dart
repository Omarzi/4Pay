import 'package:bloc/bloc.dart';
import 'package:cash_app/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'free_charge_state.dart';

class FreeChargeCubit extends Cubit<FreeChargeState> {
  FreeChargeCubit() : super(FreeChargeInitialState());

  static FreeChargeCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  /// Function to get Number of Cards.



  /// Function to Make Post Free Charge .... (Send The selected from user and number of user)
}
