import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_app/utils/styles.dart';

class HomeScreen extends StatelessWidget {
  final mainScrollController = ScrollController();

  Widget notificationBadge() {
    return Stack(
      children: <Widget>[
        Icon(Icons.notifications_outlined, size: 28),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: BoxConstraints(
              minWidth: 12,
              minHeight: 12,
            ),
            child: Text(
              '10',
              style: TextStyle(
                color: Colors.black,
                fontSize: 8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

  Widget profileBar(BuildContext context) {
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/profile1.jpg'),
          ),
          SizedBox(width: 10),
          Text(
            "Bimbo",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Spacer(),
          notificationBadge()
        ],
      ),
    );
  }

  Widget rewardsBar(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Impressions",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "2,000,000",
                      style: TextStyle(
                        fontSize: 24,
                        color: purple,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              color: lightBlue,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  "Rewards",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "N10,000",
                  style: TextStyle(
                    fontSize: 24,
                    color: purple,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget feedWidget(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top:24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/profile2.jpg'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ade Emmanuel",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      //  SizedBox(height: 6),
                      Text(
                        "Lagos, Nigeria",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(CupertinoIcons.ellipsis, size: 28)
                ],
              ),
            ),
            Container(
              height: 500,
              margin: const EdgeInsets.only(
                top: 10,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/photo.png'),
                ),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightGray,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              profileBar(context),
              rewardsBar(context),
              SizedBox(height: 12),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    feedWidget(context),
                    feedWidget(context),
                    feedWidget(context),
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
