import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_Cubit/weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherStatesqq> {
  WeatherCubit(this.weatherService) : super(Weatherinitial());

  WeatherService weatherService;
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    print('*******************WeatherLoading');
    emit(WeatherLoading());
    
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
    print('****************WeatherSuccess');

      emit(WeatherSuccess());

    } on Exception catch (e) {
    print('****************WeatherFailure');

      emit(WeatherFailure());

    }
  }
}
