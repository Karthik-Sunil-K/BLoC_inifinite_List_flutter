import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:listmore/models/user.dart';
import 'package:listmore/repositories/user_repo.dart';
import 'package:meta/meta.dart';
import 'package:query_params/query_params.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial());
  UserRepo userRepo = UserRepo();
  List<User> userList = [];
  int page = 0, limit = 10;
  bool isLoading = false;

  @override
  Stream<UsersState> mapEventToState(
    UsersEvent event,
  ) async* {
    if (event is Fetchusers) {
      if (!isLoading) {
        isLoading = true;
        try {
          page++;
          URLQueryParams queryParams = URLQueryParams();
          queryParams.append('page', page);
          queryParams.append('limit', limit);
          List<User>? list= await userRepo.getUser(queryParams);
        if(list==null){
          page--;
          yield ErrorState('Failed to fetch');
        }
        else{
          userList.addAll(list);
          yield LoadedUsers(userList);
        }
        } catch (e) {
          page--;
          yield ErrorState('Failed to fetch');
        }
        isLoading = false;
      }
    }
  }
}
