import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_bloc_app/bloc/weather_bloc.dart';
import 'package:weather_bloc_app/widgets/weather_condition_codes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 139, 125, 151),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 139, 125, 151),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1.1),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: const Color.fromARGB(175, 212, 255, 253),
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherSuccess) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10, height: 30),
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              Text(
                                state.weather.areaName.toString(),
                                style: theme.textTheme.titleSmall,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Greetings!',
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                          getWeatherIcon(state.weather.weatherConditionCode),
                          Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round().toString()} °C',
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                          Center(
                            child: Text(
                              state.weather.weatherMain
                                  .toString()
                                  .toUpperCase(),
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                          Center(
                            child: Text(
                              DateFormat(
                                'EEEE, dd MMM,',
                              ).add_jm().format(state.weather.date!),
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/8.png', scale: 8),
                                  SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 3,
                                    children: [
                                      Text('Sunrise'),
                                      Text(
                                        DateFormat().add_jm().format(
                                          state.weather.sunrise!,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/9.png', scale: 8),
                                  SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 3,
                                    children: [
                                      Text('Sunset'),
                                      Text(
                                        DateFormat().add_jm().format(
                                          state.weather.sunset!,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Divider(color: theme.dividerColor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/10.png', scale: 8),
                                  SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 3,
                                    children: [
                                      Text('Max Temp'),
                                      Text(
                                        '${state.weather.tempMax!.celsius!.round().toString()} °C',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/11.png', scale: 8),
                                  SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 3,
                                    children: [
                                      Text('Min Temp'),
                                      Text(
                                        '${state.weather.tempMin!.celsius!.round().toString()} °C',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Text('Something happend..');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
