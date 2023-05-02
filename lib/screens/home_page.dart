import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_task/models/emoji_model.dart';
import 'package:flutter_task/helpher.dart';

import '../models/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmojiParser emojiParser = EmojiParser();

  List<EmojiModel> emojiModels = [];
  List<FlSpot> flSpots = [];

  void fetchData() async {
    UserReqIdModel? userReqIdModel = await Helpher.getAll();
    if (userReqIdModel != null) {
      // debugPrint('data ${userReqIdModel.moodalytics.length}');
      emojiModels = userReqIdModel.moodalytics
          .map((e) =>
              EmojiModel(emojiPoint: e.emojiPoint!, createdAt: e.createdAt))
          .toList();
      for (int i = 0; i < emojiModels.length; i++) {
        flSpots.add(FlSpot(i.toDouble(), emojiModels[i].emojiPoint.toDouble()));
      }

      flSpots.forEach((element) {
        debugPrint('${element.x}, ${element.y}');
      });
      setState(() {});
    } else {
      debugPrint("null");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Xcellence PVT LTD Company,Lucknow",
          style: TextStyle(fontSize: 13),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/bedroom.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              title: Text(
                "Alok Maurya",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              subtitle: Text(
                "Developer",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white38, Colors.black26, Colors.black]),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.orangeAccent, width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "How's the ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        children: <InlineSpan>[
                          TextSpan(
                            text: "Mood",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: "\nToday",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
                        child: Text(
                      emojiParser.emojify(
                        ":grinning:     :innocent:     :expressionless:     :disappointed:     :rage:",
                      ),
                      // "😃      😇      😑      😞      😡",
                      style: TextStyle(fontSize: 28, color: Colors.deepOrange),
                    )),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 0.8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.speed, color: Colors.orangeAccent, size: 30),
                const SizedBox(width: 8),
                Text(
                  "Team Mood",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    thickness: 0.8,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white38, Colors.black26, Colors.black],
                  ),
                  border: Border.all(color: Colors.orangeAccent, width: 1.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '"  ',
                      style:
                          TextStyle(color: Colors.orangeAccent, fontSize: 20),
                      children: [
                        TextSpan(
                            text: 'The team is feeling good',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        TextSpan(
                            text: '\n    today',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        TextSpan(
                          text: '                              "',
                        ),
                      ],
                    ),
                  ),
                  Text(
                    emojiParser.emojify(":innocent:"),
                    // "😇",
                    style: TextStyle(fontSize: 35, color: Colors.deepOrange),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: emojiParser.emojify(":innocent:"),
                    style: TextStyle(fontSize: 24),
                    children: [
                      TextSpan(
                          text: "  Moodalytics",
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Text(
                  "(Trend chart on Mood)",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9), fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.white12,
              child: LineChart(
                LineChartData(
                    gridData: FlGridData(
                      show: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          strokeWidth: 1,
                        );
                      },
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          strokeWidth: 1,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                        left: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                        right: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                        top: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                    ),
                    lineBarsData: [LineChartBarData(spots: flSpots)]),
                /* SfCartesianChart(
                series: <ChartSeries>[
                  LineSeries<EmojiModel, String>(
                    dataSource: emojiModels,
                    xValueMapper: (EmojiModel year, _) => year.createdAt,
                    yValueMapper: (EmojiModel emoji, _) => emoji.emojiPoint,
                  )
                ],
              ),*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}
