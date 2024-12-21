import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/pages/bloc/ecommerce_bloc.dart';
import 'package:flutter_ecommerce_app/pages/main_page.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => EcommerceBloc(),
    child: const MaterialApp(
      home: MainPage(),
    ),
  ));
}
