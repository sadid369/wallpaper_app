import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScrollListPage extends StatefulWidget {
  const ScrollListPage({super.key});

  @override
  State<ScrollListPage> createState() => _ScrollListPageState();
}

class _ScrollListPageState extends State<ScrollListPage> {
  var endOfList = '';
  List<Color> arrColors = [
    Colors.orange,
    Colors.grey,
    Colors.green,
    Colors.purple,
    Colors.yellow,
    Colors.blue,
    Colors.blueGrey,
    Colors.red,
    Colors.indigo,
    Colors.pink,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(endOfList),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            print(notification.metrics.pixels);
            if (notification.metrics.pixels ==
                notification.metrics.maxScrollExtent) {
              print('End of List');
              arrColors.add(Colors.grey);
              arrColors.add(Colors.grey);
              arrColors.add(Colors.grey);
              arrColors.add(Colors.grey);
              arrColors.add(Colors.grey);
              setState(() {});
            }
            return false;
          },
          child: GridView.builder(
            itemCount: arrColors.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 11,
                crossAxisSpacing: 11,
                childAspectRatio: 9 / 16),
            itemBuilder: (context, index) {
              return Container(
                color: arrColors[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
