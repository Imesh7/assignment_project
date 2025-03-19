import 'package:assignment_project/feature/home/ui/home.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/dto/employee.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(LoadingHomeState());

  final List<DataModel> list = [
    DataModel("Rent", Icons.car_crash, Colors.pink.shade200),
    DataModel("Buy", Icons.card_travel, Colors.yellow.shade500),
    DataModel("Rent", Icons.car_crash, Colors.green.shade200),
  ];
}


