import 'package:flutter_template_app/core/base/api_wrapper.dart';
import 'package:flutter_template_app/core/base/state_wrapper.dart';
import 'package:flutter_template_app/core/exceptions/network_exceptions.dart';
import 'package:flutter_template_app/data/network/dto/config/config_dto.dart';
import 'package:flutter_template_app/data/repositories/splash_repository.dart';
import 'package:bloc/bloc.dart';

class SplashCubit extends Cubit<StateWrapper<ConfigDto>> {

  final SplashRepository configRepository;

  SplashCubit({required this.configRepository}): super(Idle());

  config(String serverHost) async {
    emit(StateWrapper.loading());
    ApiWrapper<ConfigDto> apiResult = await configRepository.config(serverHost);
    apiResult.when(success: (ConfigDto data) {
      emit(StateWrapper.data(data: data));
    }, failure: (NetworkExceptions error) async {
      emit(StateWrapper.error(error: error));
    });
  }


}
