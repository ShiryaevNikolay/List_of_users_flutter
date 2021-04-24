abstract class BaseState {}

// Состояние загрузки пользотелей
class LoadingState extends BaseState {}

// Состояние показа  пользотелей
class ShowUsersState extends BaseState {
  ShowUsersState({this.users});
  final users;
}

// Состояние ошибки загрузки
class ErrorState extends BaseState {}