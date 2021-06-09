import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listmore/blocs/bloc/users_bloc.dart';
import 'package:bloc/bloc.dart';
import 'dart:js';
import 'package:path/path.dart';


class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
 late UsersBloc usersBloc;
  void initState(){
    super.initState();
    usersBloc = BlocProvider.of<UsersBloc>(this.context);
    usersBloc.add(Fetchusers());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Container(
        child: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if(state is LoadedUsers){
              return ListView.separated(itemBuilder: (context,index){
                return ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(state.userList[index].avatar),),
                  title: Text(state.userList[index].name),
                  trailing: OutlinedButton(child: Text('viewe'),onPressed: (){print('helow');},),
                );
              }, separatorBuilder:(context,index)=>Divider(), itemCount: state.userList.length);
            }else if(state is ErrorState){
              return Center(child: Text('error'),);
            }
            return Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}







