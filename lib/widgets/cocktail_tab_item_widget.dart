import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/cocktail_api.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/screens/cocktail_detail_screen.dart';

class CocktailTabItem extends StatelessWidget {
  // final baseUrl = CocktailProject.baseUrl;
  final baseUrl = CocktailApi.baseUrl;
  final int id;
  final String imgUrl, name;
  final Geolocation geolocation;

  const CocktailTabItem({
    super.key,
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.geolocation,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      // fit: FlexFit.loose,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CocktailDetailScreen(
                id: id,
                name: name,
                imgUrl: imgUrl,
                geolocation: geolocation,
              ),
            ),
          );
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = constraints.maxWidth;
            return SizedBox(
              width: size,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 10,
                ),
                child: Stack(
                  children: [
                    // Image.network(
                    //   '$baseUrl/$imgUrl',
                    //   fit: BoxFit.fill,
                    // ),
                    Image(
                      image: AssetImage('assets/image/$imgUrl'),
                      fit: BoxFit.fill,
                    ),
                    Positioned.fill(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bookmark_border_outlined,
                                ),
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Text(
                                  name.length > 20
                                      ? name.substring(0, 20)
                                      : name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
