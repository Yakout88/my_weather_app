import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/cubits/cubit/get_weather_cubit_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a City",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                BlocProvider.of<GetWeatherCubitCubit>(context)
                    .getWeatherData(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(32),
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                hintText: "Enter City Name",
                label: Text("Search"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
