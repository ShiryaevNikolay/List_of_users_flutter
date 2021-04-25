import 'package:flutter/material.dart';
import 'package:users_list_flutter/bloc/bloc_state.dart';
import 'package:users_list_flutter/widgets/user_card.dart';

class ShowUserList extends StatefulWidget {
  ShowUserList({this.state});

  final ShowUsersState? state;

  @override
  _ShowUserListState createState() => _ShowUserListState();
}

class _ShowUserListState extends State<ShowUserList> {
  ScrollController? _controller;
  bool _centerTitle = false;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();

    _controller?.addListener(() {
      if (_controller!.offset > 60 && !_controller!.position.outOfRange) {
        if (!_centerTitle) {
          setState(() {
            _centerTitle = true;
          });
        }
      }
      if (_controller!.offset <= 60 && !_controller!.position.outOfRange) {
        if (_centerTitle) {
          setState(() {
            _centerTitle = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
        controller: _controller,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: false,
            snap: false,
            expandedHeight: 130,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              title:
                  Text("Пользователи", style: TextStyle(color: Colors.black)),
              centerTitle: _centerTitle,
            ),
            centerTitle: true,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => UserCard(user: widget.state!.users[index]),
            childCount: widget.state!.users.length,
          ))
        ],
      );
}
