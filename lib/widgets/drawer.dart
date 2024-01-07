import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  final Widget child;
  const AppDrawer({key, required this.child}) : super(key: key);

  static _AppDrawerState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AppDrawerState>();

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  static Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  static const double maxSlide = 255;
  static const dragRightStartVal = 60;
  static const dragLeftStartVal = maxSlide - 20;
  static bool shouldDrag = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: _AppDrawerState.duration);
    super.initState();
  }

  void close() => _controller.reverse();

  void open() => _controller.forward();

  void toggle() {
    if (_controller.isCompleted) {
      close();
    } else {
      open();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragStart(DragStartDetails startDetails) {
    bool isDraggingFromLeft = _controller.isDismissed &&
        startDetails.globalPosition.dx < dragRightStartVal;
    bool isDraggingFromRight = _controller.isCompleted &&
        startDetails.globalPosition.dx > dragLeftStartVal;
    shouldDrag = isDraggingFromLeft || isDraggingFromRight;
  }

  void _onDragUpdate(DragUpdateDetails updateDetails) {
    if (shouldDrag == false) {
      return;
    }
    double delta = updateDetails.primaryDelta! / maxSlide;
    _controller.value += delta;
  }

  void _onDragEnd(DragEndDetails dragEndDetails) {
    if (_controller.isDismissed || _controller.isCompleted) {
      return;
    }

    double kMinFlingVelocity = 365.0;
    double dragVelocity = dragEndDetails.velocity.pixelsPerSecond.dx.abs();

    if (dragVelocity >= kMinFlingVelocity) {
      double visualVelocityInPx = dragEndDetails.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _controller.fling(velocity: visualVelocityInPx);
    } else if (_controller.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          double animationVal = _controller.value;
          double translateVal = animationVal * maxSlide;
          double scaleVal = 1 - (animationVal * 0.3);
          return Stack(
            children: <Widget>[
              const CustomDrawer(),
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..translate(translateVal)
                  ..scale(scaleVal),
                child: GestureDetector(
                    onTap: () {
                      if (_controller.isCompleted) {
                        close();
                      }
                    },
                    child: widget.child),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff5956E9),
      child: SafeArea(
        child: Theme(
          data: ThemeData(
            brightness: Brightness.dark,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 52, bottom: 30),
                    child: const Image(
                      image: AssetImage('assets/images/EllipseMorado.png'),
                    ),
                  )
                ],
              ),
              const ListTile(
                leading: Icon(Icons.person_outline),
                title: Text('Profile'),
              ),
              const SizedBox(
                  width: 206,
                  child: Padding(
                    padding: EdgeInsets.only(left: 74, right: 0),
                    child: Divider(
                      color: Color(0xfff4f4f8),
                    ),
                  )),
              const ListTile(
                leading: Icon(Icons.shopping_cart_outlined),
                title: Text('My orders'),
              ),
              const SizedBox(
                  width: 206,
                  child: Padding(
                    padding: EdgeInsets.only(left: 74, right: 0),
                    child: Divider(
                      color: Color(0xfff4f4f8),
                    ),
                  )),
              const ListTile(
                leading: Icon(Icons.favorite_border_outlined),
                title: Text('Favorites'),
              ),
              const SizedBox(
                  width: 206,
                  child: Padding(
                    padding: EdgeInsets.only(left: 74, right: 0),
                    child: Divider(
                      color: Color(0xfff4f4f8),
                    ),
                  )),
              const ListTile(
                leading: Icon(Icons.shopping_bag_outlined),
                title: Text('Delivery'),
              ),
              const SizedBox(
                  width: 206,
                  child: Padding(
                    padding: EdgeInsets.only(left: 74, right: 0),
                    child: Divider(
                      color: Color(0xfff4f4f8),
                    ),
                  )),
              const ListTile(
                leading: Icon(Icons.settings_outlined),
                title: Text('Settings'),
              ),
              Container(
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage('assets/images/EllipseMorado.png'),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 38, top: 17, bottom: 80),
                alignment: Alignment.centerLeft,
                child: const Image(
                  image: AssetImage('assets/images/circulomoradorelleno.png'),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Sign Out'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
