import 'package:flutter/material.dart';
import 'package:wisatabandung/model/tourism_place.dart';

class DetailMobileScreen extends StatelessWidget {
  // const DetailScreen({Key? key}) : super(key: key);
  final TourismPlace place;
  DetailMobileScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Hero(
          tag: 'logo',
          child: SingleChildScrollView(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Image.asset(place.imageAsset),
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: IconButton(
                                  color: Colors.white,
                                  icon: Icon(Icons.arrow_back),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              FavoriteButton(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: Text(
                        place.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Icon(Icons.calendar_today),
                              SizedBox(height: 8.0),
                              Text(
                                place.openDays,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.access_time),
                              SizedBox(height: 8.0),
                              Text(
                                place.openTime,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.monetization_on),
                              SizedBox(height: 8.0),
                              Text(
                                place.ticketPrice,
                              ),
                            ],
                          )
                        ]),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      place.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: place.imageUrls.map((url) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(url),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
      color: Colors.red,
    );
  }
}
