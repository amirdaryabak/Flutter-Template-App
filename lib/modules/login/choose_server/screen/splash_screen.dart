import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_app/core/base/state_wrapper.dart';
import 'package:flutter_template_app/core/constants/assets.dart';
import 'package:flutter_template_app/core/constants/dimens/dimens.dart';
import 'package:flutter_template_app/core/constants/general.dart';
import 'package:flutter_template_app/core/constants/strings/strings.dart';
import 'package:flutter_template_app/core/exceptions/network_exceptions.dart';
import 'package:flutter_template_app/data/network/dto/config/config_dto.dart';
import 'package:flutter_template_app/data/repositories/splash_repository.dart';
import 'package:flutter_template_app/modules/login/choose_server/cubit/choose_server_cubit.dart';
import 'package:flutter_template_app/widget/progress_button/progress_button.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => SplashRepository(),
        child: BlocProvider<SplashCubit>(
          create: (context) =>
              SplashCubit(configRepository: RepositoryProvider.of<SplashRepository>(context)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(
                  builder: (BuildContext context) =>
                      SizedBox(
                        width: Dimens.btn_width_submit,
                        height: Dimens.btn_height_submit,
                        child: ProgressButton(
                            borderRadius: BorderRadius.all(Radius.circular(Dimens
                                .btn_normal_border_radius)),
                            onPressed: (AnimationController controller) {
                              _controller = controller;
                              BlocProvider.of<SplashCubit>(context)
                                  .config(BASE_URL);
                            },
                            child: Text(Strings.continueWithSaaSServer, style: TextStyle(
                                color: Colors.white),)),
                      ),
                ),
                BlocConsumer<SplashCubit, StateWrapper<ConfigDto>>(
                  listener: (context, state) {
                    state.when(
                        idle: () {},
                        loading: () {
                          _controller.forward();
                        },
                        data: (ConfigDto data) {
                          _controller.reverse();
                        },
                        error: (NetworkExceptions error) {}
                    );
                  },
                  builder: (context, state) {
                    return state.when(
                        idle: () {
                          return Container();
                        },
                        loading: () {
                          return Container();
                        }, data: (ConfigDto data) {
                      return Container();
                    }, error: (NetworkExceptions error) {
                      return Text(NetworkExceptions.getErrorMessage(error));
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
