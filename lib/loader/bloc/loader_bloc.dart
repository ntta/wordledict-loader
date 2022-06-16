import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loader_event.dart';
part 'loader_state.dart';

class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  LoaderBloc() : super(LoaderInitial()) {
    on<LoaderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
