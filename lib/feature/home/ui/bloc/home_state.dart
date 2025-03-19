part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  final List<DataModel> list = [
    DataModel("Rent", Icons.car_crash, Colors.pink.shade200),
    DataModel("Buy", Icons.card_travel, Colors.yellow.shade500),
    DataModel("Rent", Icons.car_crash, Colors.green.shade200),
  ];
}

class HomeInitial extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingHomeState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
