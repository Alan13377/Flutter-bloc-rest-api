import 'package:flutter/material.dart';
import 'package:rest_bloc/models/user_model.dart';

class DetailScreen extends StatelessWidget {
  final UserModel e;
  const DetailScreen({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Center(
              child: CircleAvatar(
                maxRadius: 60,
                backgroundImage: NetworkImage(e.avatar),
              ),
            ),
            Text(e.firstName + " " + e.lastName),
            Text(e.email)
          ]),
        ),
      ),
    );
  }
}
