part of 'bag_cubit.dart';

abstract class BagState extends Equatable {
  const BagState();

  @override
  List<Object> get props => [];
}

class BagInitial extends BagState {}


class Waitting extends BagState{}

class Success extends BagState{}

class Error extends BagState{
  final String errorMessage;

  const Error(this.errorMessage);
}