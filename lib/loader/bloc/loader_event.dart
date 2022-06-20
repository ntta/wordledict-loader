part of 'loader_bloc.dart';

abstract class LoaderEvent extends Equatable {
  const LoaderEvent();
}

class LoaderStarted extends LoaderEvent {
  const LoaderStarted();

  @override
  List<Object?> get props => [];
}
