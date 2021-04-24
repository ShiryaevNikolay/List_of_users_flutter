import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list_flutter/bloc/bloc_event.dart';
import 'package:users_list_flutter/bloc/bloc_state.dart';
import 'package:users_list_flutter/data/services/network.dart';

class MainBloc extends Bloc<BaseEvent, BaseState> {
  final _networkService = NetworkService();

  MainBloc(BaseState initialState) : super(LoadingState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    // Если событие получения пользотелей
    if (event is FetchUsersEvent) {
      // Перед получением пользователей показываем состояние загрузки
      yield LoadingState();

      try {
        // Получаем пользователей
        // TODO: реализовать получение пользователей
        //
        // После получения пользователей, показываем состояние со списком пользователей
        yield ShowUsersState();
      } catch (_) {
        // При возникновении ошибки показываем состояние экрана с ошибкой
        yield ErrorState();
      }
    }
  }
}
