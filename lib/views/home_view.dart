import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/cubits/cubit/get_weather_cubit_cubit.dart';
import 'package:my_weather_app/views/no_weather_info.dart';
import 'package:my_weather_app/views/search_view.dart';
import 'package:my_weather_app/views/weather_loaded.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchView(),
              ));
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubitCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherLoadedSuccess) {
            return WeatherLoaded();
          } else if (state is WeatherInitialState) {
            return NoWeatherInfo();
          } else {
            return Text("data");
          }
        },
      ),
    );
  }
}
