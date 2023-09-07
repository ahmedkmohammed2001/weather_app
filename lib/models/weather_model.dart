// import 'package:flutter/material.dart';

// class WeatherModel {
//   DateTime date;
//   var temp;
//   var maxTemp;
//   var mvaremp;
//   String weatherStateName;
//   var wind_dir;

//   WeatherModel(
//       {required required this.date,
//       required required this.temp,
//       required required this.maxTemp,
//       required required this.mvaremp,
//       required required this.weatherStateName,
//       required required this.wind_dir
//       });

//   factory WeatherModel.fromJson(dynamic data) {
//     var jsonData = data['forecast']['forecastday'][0]['day'];

//     return WeatherModel(
//         date: DateTime.parse( data['current']['last_updated']),
//         temp: jsonData['avgtemp_c'],
//        wind_dir:jsonData['avgvis_km'],
//         maxTemp: jsonData['maxtemp_c'],
//         mvaremp: jsonData['mvaremp_c'],
//         weatherStateName: jsonData['condition']['text']
//         );
//   }

//   @override
//   String toString() {
//     return 'tem = $temp  mvaremp = $mvaremp  date = $date';
//   }

//    String getImage() {
//     if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||  weatherStateName == 'partly cloudy') {
//       return 'assets/images/clear.png';
//     } else if (
        
//         weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
//       return 'assets/images/snow.png';
//     } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
//       return 'assets/images/cloudy.png';
//     } else if (weatherStateName == 'Patchy rain possible' ||
//         weatherStateName == 'Heavy Rain' ||
//         weatherStateName == 'Showers	') {
//       return 'assets/images/rainy.png';
//     } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
//       return 'assets/images/thunderstorm.png';
//     } else {
//       return 'assets/images/clear.png';
//     }
//   }
// MaterialColor getThemeColor() {
//     if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||  weatherStateName == 'partly cloudy') {
//       return Colors.orange;
//     } else if (
        
//         weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
//       return Colors.blue;
//     } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
//       return Colors.blueGrey;
//     } else if (weatherStateName == 'Patchy rain possible' ||
//         weatherStateName == 'Heavy Rain' ||
//         weatherStateName == 'Showers	') {
//       return Colors.blue;
//     } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
//       return Colors.deepPurple;
//     } else {
//       return Colors.orange;
//     }
//   }

  
// }
// To parse required this JSON data, do
//
//     final weatherData = weatherDataFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
    WeatherModel({
        required this.location,
        required this.current,
        required this.forecast,
    });

    Location location;
    Current current;
    Forecast forecast;

    factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
        forecast: Forecast.fromJson(json["forecast"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
        "forecast": forecast.toJson(),
    };
}

class Current {
    Current({
         required this.lastUpdatedEpoch,
        required this.lastUpdated,
        required this.tempC,
        required this.tempF,
        required this.isDay,
        required this.condition,
        required this.windMph,
        required this.windKph,
        required this.windDegree,
        required this.windDir,
        required this.pressureMb,
        required this.pressureIn,
        required this.precipMm,
        required this.precipIn,
        required this.humidity,
        required this.cloud,
        required this.feelslikeC,
        required this.feelslikeF,
        required this.visKm,
        required this.visMiles,
        required this.uv,
        required this.gustMph,
        required this.gustKph,
    });

    var lastUpdatedEpoch;
    String lastUpdated;
    var tempC;
    var tempF;
    var isDay;
    Condition condition;
    var windMph;
    var windKph;
    var windDegree;
    String windDir;
    var pressureMb;
    var pressureIn;
    var precipMm;
    var precipIn;
    var humidity;
    var cloud;
    var feelslikeC;
    var feelslikeF;
    var visKm;
    var visMiles;
    var uv;
    var gustMph;
    var gustKph;

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"],
        tempF: json["temp_f"],
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"],
        windKph: json["wind_kph"],
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"],
        pressureIn: json["pressure_in"]   ,
        precipMm: json["precip_mm"]   ,
        precipIn: json["precip_in"]   ,
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"]   ,
        feelslikeF: json["feelslike_f"]   ,
        visKm: json["vis_km"],
        visMiles: json["vis_miles"],
        uv: json["uv"],
        gustMph: json["gust_mph"]   ,
        gustKph: json["gust_kph"]   ,
    );

    Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
    };
}

class Condition {
    Condition({
        required this.text,
        required this.icon,
        required this.code,
    });

    String text;
    String icon;
    var code;

    factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
    };
}

class Forecast {
    Forecast({
        required this.forecastday,
    });

    List<Forecastday> forecastday;

    factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: List<Forecastday>.from(json["forecastday"].map((x) => Forecastday.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "forecastday": List<dynamic>.from(forecastday.map((x) => x.toJson())),
    };
}

class Forecastday {
    Forecastday({
        required this.date,
        required this.dateEpoch,
        required this.day,
    });

    DateTime date;
    var dateEpoch;
    Map<String, double> day;

    factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"],
        day: Map.from(json["day"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "date_epoch": dateEpoch,
        "day": Map.from(day).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class Location {
    Location({
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.tzId,
        required this.localtimeEpoch,
        required this.localtime,
    });

    String name;
    String region;
    String country;
    var lat;
    var lon;
    String tzId;
    var localtimeEpoch;
    String localtime;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"],
        lon: json["lon"],
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
    };
}
