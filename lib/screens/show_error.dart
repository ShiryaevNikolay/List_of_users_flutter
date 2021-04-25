import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_list_flutter/bloc/bloc_event.dart';
import 'package:users_list_flutter/bloc/main_bloc.dart';
import 'package:users_list_flutter/widgets/button.dart';

class ShowError extends StatelessWidget {
  late final MainBloc _bloc;

  void _updateCallback() {
    _bloc.add(FetchUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<MainBloc>(context);

    return Center(
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
              onPressed: _updateCallback,
            )
          ],
        ),
      ),
    );
  }
}
