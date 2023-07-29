part of 'fav_cubit.dart';

abstract class FavState extends Equatable {
  const FavState();

  @override
  List<Object> get props => [];
}

class FavInitial extends FavState {}


class Waitting extends FavState{}

class Success extends FavState{}

class Error extends FavState{
  final String errorMessage;

  const Error(this.errorMessage);
}