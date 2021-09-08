import 'package:flutter/material.dart';

import '../constants/constant.dart';
class HomeScreenNull extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cityController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    AppConstants.titleSearchWeather,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.white),
                  ),
                  Spacer(),
                  TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(
                      filled: true,
                      // fillColor: Color(0xFF1C2341),
                      hintText: AppConstants.textFieldSearchCity,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(AppConstants.buttonSeachWeather,
                            style: Theme.of(context).textTheme.button)),
                  ),
                  Spacer(
                    flex: 2,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
