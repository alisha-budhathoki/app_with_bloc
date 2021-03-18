import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'iternet_state.dart';

class IternetCubit extends Cubit<IternetState> {
  IternetCubit() : super(IternetInitial());
}
