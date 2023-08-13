import 'package:cash_app/features/auth/presentation/views/widgets/create_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateView extends StatelessWidget {
  const CreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CreateBody(),
    );
  }
}
