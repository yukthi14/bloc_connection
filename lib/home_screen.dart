import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/internet_bloc.dart';
import 'bloc/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState>(

              builder: (context, state) {

            if (state is InternetGainedState) {

              return Text("Connected");
            } else if (state is InternetLostState) {
              return Text("Not Connected!!");
            } else {
              return Text("Loading......");
            }
          }, listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Internet Connected!"),
                backgroundColor: Colors.green,
              ));
            }
            else if(state is InternetLostState){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Internet Not Connected"),backgroundColor: Colors.red,
              ));
            }

          }),
        ),
      ),
    );
  }
}
