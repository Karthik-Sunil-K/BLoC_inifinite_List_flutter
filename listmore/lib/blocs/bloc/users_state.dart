part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class LoadedUsers extends UsersState{
  final List<User> userList;
  LoadedUsers(this.userList);
  List<Object> get props=>[this.userList];

}

class ErrorState extends UsersState{
  final String message;
  ErrorState(this.message);
   List<Object> get props=>[this.message];
}
