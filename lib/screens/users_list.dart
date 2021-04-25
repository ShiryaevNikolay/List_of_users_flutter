import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_list_flutter/bloc/bloc_event.dart';
import 'package:users_list_flutter/bloc/bloc_state.dart';
import 'package:users_list_flutter/bloc/main_bloc.dart';
import 'package:users_list_flutter/screens/show_user.dart';
import 'package:users_list_flutter/widgets/button.dart';
import 'package:users_list_flutter/widgets/user_card.dart';

class UsersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: Scaffold(
            body: BlocBuilder<MainBloc, BaseState>(
                bloc: MainBloc()..add(FetchUsersEvent()),
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
                })),
      );

  Widget get _buildLoadingState => Center(
        child: CircularProgressIndicator(),
      );

  Widget get _buildErrorState => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/ic_warning.svg"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text("Не удалось загрузить информацию"),
              ),
              CustomButton(
                child: Text("Обновить"),
                width: 230.toDouble(),
                onPressed: () {},
              )
            ],
          ),
        ),
      );

  Widget _buildListUsers(ShowUsersState state) => ShowUserList(state: state,);
}
