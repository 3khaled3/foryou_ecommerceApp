part of 'api_cubit.dart';

abstract class ApiState extends Equatable {
  const ApiState();

  @override
  List<Object> get props => [];
}

class ApiInitial extends ApiState {}

class Waitting extends ApiState {}

class Success extends ApiState {}

class Error extends ApiState {
  final String errorMessage;

  Error(this.errorMessage);
}
