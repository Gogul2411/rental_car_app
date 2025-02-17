import 'package:flutter/material.dart';
import 'package:rental_car_app/data/models/car.dart';
import 'package:rental_car_app/presentation/pages/map_details_page.dart';
import 'package:rental_car_app/presentation/widgets/car_card.dart';
import 'package:rental_car_app/presentation/widgets/more_card.dart';

class CarDetailsPage extends StatelessWidget {
  final Car car;

  const CarDetailsPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            SizedBox(
              width: 5,
            ),
            Text('Information'),
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(
            car: Car(
              model: car.model,
              distance: car.distance,
              fuelCapacity: car.fuelCapacity,
              pricePerHour: car.pricePerHour,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          )
                        ]),
                    child: const Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/user.png'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Jaane Cooper',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$4,253',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapDetailsPage(car: car),
                        ),
                      );
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          )
                        ],
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/maps.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(
                  car: Car(
                    model: "${car.model}-1",
                    distance: car.distance + 100,
                    fuelCapacity: car.fuelCapacity + 100,
                    pricePerHour: car.pricePerHour + 10,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                MoreCard(
                  car: Car(
                    model: "${car.model}-2",
                    distance: car.distance + 200,
                    fuelCapacity: car.fuelCapacity + 200,
                    pricePerHour: car.pricePerHour + 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                MoreCard(
                  car: Car(
                    model: "${car.model}-3",
                    distance: car.distance + 300,
                    fuelCapacity: car.fuelCapacity + 300,
                    pricePerHour: car.pricePerHour + 30,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
