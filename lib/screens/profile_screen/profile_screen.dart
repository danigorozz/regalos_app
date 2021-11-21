import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color textColor = Color(0xFF2A2A49);
    Color backgroundColor = Color(0xFFf9f4ec);
    TextStyle nameStyle =
        TextStyle(color: textColor, fontSize: 28, fontWeight: FontWeight.bold);
    TextStyle titleStyle = TextStyle(color: textColor, fontSize: 28);
    TextStyle levelStyle =
        TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w300);
    TextStyle numberStyle =
        TextStyle(color: textColor, fontSize: 36, fontWeight: FontWeight.bold);
    TextStyle textStyle =
        TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w300);
    int defeats = 12;
    int victories = 37;

    NetworkImage avatarImage = NetworkImage(
        "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png");

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserNameAndPhoto(nameStyle: nameStyle, levelStyle: levelStyle),
              DefeatsVictoriesWidget(
                  defeats: defeats,
                  victories: victories,
                  numberStyle: numberStyle,
                  textStyle: textStyle),
              RankingWidget(titleStyle: titleStyle),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Historial", style: titleStyle),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 120,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                width: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: avatarImage,
                                            radius: 20,
                                          ),
                                          Text("3"),
                                          CircleAvatar(
                                            backgroundImage: avatarImage,
                                            radius: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color: Colors.red,
                                      width: double.infinity,
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: avatarImage,
                                            radius: 20,
                                          ),
                                          Text("1"),
                                          CircleAvatar(
                                            backgroundImage: avatarImage,
                                            radius: 20,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RankingWidget extends StatelessWidget {
  const RankingWidget({
    Key? key,
    required this.titleStyle,
  }) : super(key: key);

  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Ranking", style: titleStyle),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RankCard(),
                SizedBox(width: 10),
                RankCard(),
                SizedBox(width: 10),
                RankCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RankCard extends StatelessWidget {
  const RankCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = Color(0xFF2A2A49);
    TextStyle numberStyle =
        TextStyle(color: textColor, fontSize: 36, fontWeight: FontWeight.bold);

    return Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 5),
            Text("Málaga"),
            SizedBox(height: 20),
            Text("35", style: numberStyle),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DefeatsVictoriesWidget extends StatelessWidget {
  const DefeatsVictoriesWidget({
    Key? key,
    required this.defeats,
    required this.victories,
    required this.numberStyle,
    required this.textStyle,
  }) : super(key: key);

  final int defeats;
  final int victories;
  final TextStyle numberStyle;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: <Color>[
          Colors.red,
          Color(0xFF9ed465),
        ], stops: <double>[
          0.5,
          0.5,
        ]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("$defeats", style: numberStyle),
              Text("derrotas", style: textStyle),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("victorias", style: textStyle),
              Text("$victories", style: numberStyle),
            ],
          )
        ],
      ),
    );
  }
}

class UserNameAndPhoto extends StatelessWidget {
  const UserNameAndPhoto({
    Key? key,
    required this.nameStyle,
    required this.levelStyle,
  }) : super(key: key);

  final TextStyle nameStyle;
  final TextStyle levelStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Daniel Gómez",
                  style: nameStyle,
                ),
                Text(
                  "Amateur",
                  style: levelStyle,
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 36,
            backgroundImage: NetworkImage(
                "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"),
          )
        ],
      ),
    );
  }
}
