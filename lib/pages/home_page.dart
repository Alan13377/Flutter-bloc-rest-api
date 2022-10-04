import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_bloc/models/user_model.dart';
import 'package:rest_bloc/pages/detail_screen.dart';
import 'package:rest_bloc/repos/repositories.dart';

import '../blocs/userBloc/user_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //*Llamado al Bloc */
    return BlocProvider(
      create: (context) =>
          UserBloc(RepositoryProvider.of(context))..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("The Bloc App"),
        ),

        //**Acceso al estado */
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is UserLoadedState) {
            final List<UserModel> userList = state.users;
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              e: userList[index],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: ListTile(
                          title: Text(
                            userList[index].firstName,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            userList[index].lastName,
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(userList[index].avatar)),
                        ),
                      ),
                    ),
                  );
                });
          }

          if (state is ErrorLoadingState) {
            return Center(
              child: Text("Error"),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
