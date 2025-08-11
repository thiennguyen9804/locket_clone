import 'package:flutter/material.dart';

class NestedPageViewDemo extends StatefulWidget {
  const NestedPageViewDemo({super.key});

  @override
  _NestedPageViewDemoState createState() => _NestedPageViewDemoState();
}

class _NestedPageViewDemoState extends State<NestedPageViewDemo> {
  final PageController _outerController = PageController();
  final PageController _innerController = PageController();

  bool _outerScrollEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: _outerController,
        physics:
            _outerScrollEnabled
                ? const PageScrollPhysics()
                : const NeverScrollableScrollPhysics(),
        children: [
          Center(child: Text('Screen A', style: TextStyle(fontSize: 32))),
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification) {
                final innerPage = _innerController.page ?? 0;
                // Nếu ở page đầu và lướt ngược -> cho outer nhận scroll
                if (innerPage <= 0 &&
                    notification.metrics.pixels <= 0 &&
                    notification.scrollDelta! < 0) {
                  setState(() => _outerScrollEnabled = true);
                } else {
                  setState(() => _outerScrollEnabled = false);
                }
              }
              return false;
            },
            child: PageView(
              scrollDirection: Axis.vertical,
              controller: _innerController,
              children: [
                Container(
                  color: Colors.red,
                  child: Center(
                    child: Text('B1', style: TextStyle(fontSize: 32)),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Center(
                    child: Text('B2', style: TextStyle(fontSize: 32)),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text('B3', style: TextStyle(fontSize: 32)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
