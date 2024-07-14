import 'package:_6_weather_app/cubets/get_weather_cubit/get_weather_cubit.dart';
import 'package:_6_weather_app/cubets/get_weather_cubit/get_weather_states.dart';
import 'package:_6_weather_app/widgets/weather_info_body.dart';
import 'package:flutter/material.dart';
import 'package:_6_weather_app/widgets/no_weather_body.dart';
import 'package:_6_weather_app/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,size: 34,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherLoadedState) {
            return const WeatherInfoBody(
                // weatherModel: state.weatherModel,
                );
          } else if (state is WeatherFailureState) {
            return const Center(
              child: Text(
                "Oops there was an Error ! ",
                style: TextStyle(fontSize: 30),
              ),
            );
          } else {
            return const NoWeatherBody();
          }
        },
      ),
    );
  }
}
