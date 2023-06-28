part of 'ferry_bloc.dart';

abstract class FerryEvent {}

class InitializeFerryEvent extends FerryEvent {}

class RefetchDataEvent extends FerryEvent {}
