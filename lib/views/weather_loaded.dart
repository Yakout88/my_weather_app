import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/cubits/cubit/get_weather_cubit_cubit.dart';

class WeatherLoaded extends StatelessWidget {
  const WeatherLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              BlocProvider.of<GetWeatherCubitCubit>(context)
                  .weatherModel
                  .cityName,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Updated at : 23:46",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.ac_unit_outlined),
              Text(
                BlocProvider.of<GetWeatherCubitCubit>(context)
                    .weatherModel
                    .avgTemp
                    .toString(),
                style: TextStyle(fontSize: 18),
              ),
              Column(
                children: [
                  Text(BlocProvider.of<GetWeatherCubitCubit>(context)
                      .weatherModel
                      .maxTemp
                      .toString()),
                  Text(BlocProvider.of<GetWeatherCubitCubit>(context)
                      .weatherModel
                      .minTemp
                      .toString())
                ],
              )
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            BlocProvider.of<GetWeatherCubitCubit>(context)
                .weatherModel
                .weatherCondition,
            style: TextStyle(fontSize: 32),
          )
        ],
      ),
    );
  }
}
