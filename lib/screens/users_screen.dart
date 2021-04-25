import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list_flutter/bloc/bloc_event.dart';
import 'package:users_list_flutter/bloc/bloc_state.dart';
import 'package:users_list_flutter/bloc/main_bloc.dart';
import 'package:users_list_flutter/screens/show_error.dart';
import 'package:users_list_flutter/screens/show_user.dart';

class UsersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: Scaffold(
            body: BlocProvider(
          create: (_) => MainBloc()..add(FetchUsersEvent()),
          child: BlocBuilder<MainBloc, BaseState>(
              builder: (context, state) {
                // Если состояние загрузки
                if (state is LoadingState) {
                  return _buildLoadingState;
                }

                // Если состояние ошибки
                if (state is ErrorState) {
                  return _buildErrorState;
                }

                // Если состояние: показать список пользователей
                if (state is ShowUsersState) {
                  return _buildListUsers(state);
                }

                // Показываем дефолтное состояние
                return _buildErrorState;
              }),
        )),
      );

  Widget get _buildLoadingState => Center(
        child: CircularProgressIndicator(),
      );

  Widget get _buildErrorState => ShowError();

  Widget _buildListUsers(ShowUsersState state) => ShowUserList(
        state: state,
      );
}
