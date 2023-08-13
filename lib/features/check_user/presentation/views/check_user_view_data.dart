import 'package:cash_app/features/check_user/presentation/views/widgets/check_user_body.dart';
import 'package:flutter/material.dart';

class CheckUserView extends StatelessWidget {
  const CheckUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CheckUserBody(),
    );
  }
}
