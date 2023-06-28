part of 'ferry_bloc.dart';

abstract class FerryState {}

class FerryInitialState extends FerryState {}

class FerryLoadingState extends FerryState {}

class InitializationsDoneState extends FerryState {
  List<String> responseStringArray;
  InitializationsDoneState({required this.responseStringArray});
}
