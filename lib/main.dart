import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

import 'cubits/weather_Cubit/weather_cubit.dart';
import 'cubits/weather_Cubit/weather_states.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(WeatherService()),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
int f=0;
List <int>k=[1,23];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  WeatherModel? weatherData;
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<WeatherCubit, WeatherStatesqq>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return Scaffold(
          
              body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    // weatherData!.getThemeColor(),
                    // weatherData!.getThemeColor()[300]!,
                    // weatherData!.getThemeColor()[100]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: TextField(
                  onChanged: ((value) {
                    cityName = value;
                  }),
                  onSubmitted: ((value) async {
                    cityName = value;
                    BlocProvider.of<WeatherCubit>(context)
                        .getWeather(cityName: cityName!);
                  }),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                    label: Text('search'),
                    suffixIcon: GestureDetector(
                        onTap: () async {
                          WeatherService service = WeatherService();

                          WeatherModel? weather =
                              await service.getWeather(cityName: cityName!);
                        },
                        child: Icon(Icons.search)),
                    border: OutlineInputBorder(),
                    hintText: 'Enter a city',
                  ),
                )),
              ),
                    const Spacer(
                      flex: 3,
                    ),
                    Text(
                       weatherData!.location.country,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'updated at : ${weatherData!.current.lastUpdated.toString()}',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherData!.current.condition.icon),
                        Text(
                          weatherData!.current.tempC.toInt().toString(),
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            Text('maxTemp :${weatherData!.forecast.forecastday[0].day}'),
                            Text('minTemp : ${weatherData!.forecast.forecastday[0].day}'),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      weatherData!.current.condition.text,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(
                      flex: 5,
                    ),
                  ],
                ),
              ),
            );
          } else if (state is WeatherFailure) {
            return Column(
              children: [
                 Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: TextField(
                  onChanged: ((value) {
                    cityName = value;
                  }),
                  onSubmitted: ((value) async {
                    cityName = value;
                    BlocProvider.of<WeatherCubit>(context)
                        .getWeather(cityName: cityName!);
                  }),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                    label: Text('search'),
                    suffixIcon: GestureDetector(
                        onTap: () async {
                          WeatherService service = WeatherService();

                          WeatherModel? weather =
                              await service.getWeather(cityName: cityName!);
                        },
                        child: Icon(Icons.search)),
                    border: OutlineInputBorder(),
                    hintText: 'Enter a city',
                  ),
                )),
              ),
                Center(
                  child: Text("WeatherFailure"),
                ),
              ],
            );
          } else {
           return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: TextField(
                  onChanged: ((value) {
                    cityName = value;
                  }),
                  onSubmitted: ((value) async {
                    cityName = value;
                    BlocProvider.of<WeatherCubit>(context)
                        .getWeather(cityName: cityName!);
                  }),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                    label: Text('search'),
                    suffixIcon: GestureDetector(
                        onTap: () async {
                          WeatherService service = WeatherService();

                          WeatherModel? weather =
                              await service.getWeather(cityName: cityName!);
                        },
                        child: Icon(Icons.search)),
                    border: OutlineInputBorder(),
                    hintText: 'Enter a city',
                  ),
                )),
              ),
            );
          }
        },
      ),
    );
  }
}
