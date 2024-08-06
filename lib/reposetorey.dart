import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:testlamp/cubit/lamp_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<LampCubit, LampState>(
        listener: (context, state) {},
        builder: (context, state) {
          return FutureBuilder(
              future: BlocProvider.of<LampCubit>(context).apifetchData(),
              builder: (cotext, snapshat) {
                if (snapshat.data == false  ) {
                  BlocProvider.of<LampCubit>(context).showOn = false;
                  return Stack(
                    fit: StackFit.expand,
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Positioned(
                          top: 0,
                          child: Image.asset('assets/images/road.png',
                              height: 120)),
                      showBulb(
                        width * 0.7,
                      ),
                      showButton(250),
                    ],
                  );
                } else {
                  BlocProvider.of<LampCubit>(context).showOn = true;
                  return Stack(
                    fit: StackFit.expand,
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Positioned(
                          top: 0,
                          child: Image.asset('assets/images/road.png',
                              height: 120)),
                      showBulb(width * 0.7),
                      showButton(250),
                    ],
                  );
                }
              });
        });
  }

  Positioned showButton(
    double width,
  ) {
    return Positioned(
        bottom: width,
        child: GestureDetector(
          onTap: () {
            setState(() {
              selected ==false?  selected=true :selected =false ;
              print(selected);
            });
            BlocProvider.of<LampCubit>(context).onSwitch;
          },
          child: Column(
            children: [
              Image.asset(
                selected
                    ? 'assets/images/off_button.png'
                    : 'assets/images/on_button.png',
                width: 72,
              ),
              const SizedBox(height: 12),
              Material(
                color: Colors.transparent,
                child: Text(
                  selected ? 'TURN OFF' : 'TURN ON',
                  style: TextStyle(
                      color: selected 
                          ? Colors.grey
                          : const Color(0xffffd600)),
                ),
              )
            ],
          ),
        ));
  }

  Positioned showBulb(double width) {
    return Positioned(
      top: 100,
      child: selected
          ? Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 500,
                    spreadRadius: 1000,
                    offset: const Offset(0, 50),
                    color: const Color(0xffffd600).withOpacity(0.1)),
                BoxShadow(
                    blurRadius: 500,
                    spreadRadius: -10,
                    offset: const Offset(0, 50),
                    color: const Color(0xffffd600).withOpacity(0.3))
              ]),
              child: Image.asset('assets/images/on_bulb.png', width: width))
          : Image.asset('assets/images/off_bulb.png', width: width),
    );
  }
}
