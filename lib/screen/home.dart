import 'package:flutter/material.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:image_picker/image_picker.dart';

class HomeViewPortraitMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('MARCH 2021', style: Theme.of(context).textTheme.button), elevation: 0, backgroundColor: Theme.of(context).primaryColor),
      body: Container(
        // padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: MediaQuery.of(context).size.height / 5,
              padding: const EdgeInsets.only(bottom: 16.0, right: 16.0, left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("10000", style: Theme.of(context).textTheme.headline6),
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text("Spent this month", style: Theme.of(context).textTheme.bodyText2),
                      ),
                    ],
                  ),
                  LinearProgressIndicator(
                    value: 100,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                  Text('Remaining: 1066'),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(children: [
                      ElevatedButton.icon(
                        label: Text("Reset Budget"),
                        icon: Icon(Icons.restore),
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: OutlineButton.icon(label: Text("Insight"), icon: Icon(Icons.bar_chart), onPressed: () {}),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Text("Latest transactions"),
            ),
            Expanded(
              //TODO: convert to group list view, group with date
              child: ListView(
                children: [
                  transaction()
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        child: Icon(Icons.add),
        closedForegroundColor: Colors.black,
        openForegroundColor: Colors.white,
        closedBackgroundColor: Colors.white,
        openBackgroundColor: Colors.black,
        // labelsStyle: /* Your label TextStyle goes here */,
        // controller: /* Your custom animation controller goes here */,
        speedDialChildren: <SpeedDialChild>[
          SpeedDialChild(
            child: Icon(Icons.directions_run),
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            label: 'New receipt',
            onPressed: () {
              final ImagePicker _picker = ImagePicker();
              final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
            },
            closeSpeedDialOnPressed: false,
          ),
          SpeedDialChild(
            child: Icon(Icons.directions_walk),
            foregroundColor: Colors.black,
            backgroundColor: Colors.yellow,
            label: 'New transaction',
            onPressed: () {},
          ),
          //  Your other SpeeDialChildren go here.
        ],
      ),
    ));
  }
}

Widget transaction() {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.blue,
      radius: 20,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(Icons.shopping_cart),
        color: Colors.white,
        onPressed: () {},
      ),
    ),
    title: Text("Shopping"),
    subtitle: Text("Lotus's Sungai Dua"),
    trailing: Text('-RM 5.69', style: TextStyle(color: Colors.red)),
  );
}
