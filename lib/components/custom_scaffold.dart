import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ubenwa_test/util/theme.dart';

class GradientScaffold extends StatelessWidget {
  final Widget child;
  final Widget? bottomNavigation;

  const GradientScaffold({Key? key, required this.child, this.bottomNavigation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: bottomNavigation,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(gradient: screenGradient),
          child: SafeArea(child: child),
        ));
  }
}

class BlurDialogLayout extends StatefulWidget {
  final Widget? bottomNavigation;
  final Widget Function(BuildContext, BlurDialogFunction) builder;

  const BlurDialogLayout(
      {Key? key, this.bottomNavigation, required this.builder})
      : super(key: key);

  @override
  _BlurDialogLayoutState createState() => _BlurDialogLayoutState();
}

class _BlurDialogLayoutState extends State<BlurDialogLayout>
    with SingleTickerProviderStateMixin {
  late StreamController<Widget> controller = StreamController();
  late BlurDialogFunction blurDialogFunction = BlurDialogFunction(
      show: (dialog) => controller.sink.add(dialog),
      removeDialog: () => controller.sink.add(NilWidget()));

  late final AnimationController animController = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 500),
  )..forward();

  late final Animation<Offset> slideAnimation =
      Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
          CurvedAnimation(parent: animController, curve: Curves.decelerate));

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.builder(context, blurDialogFunction),
          StreamBuilder<Widget>(
              stream: controller.stream,
              builder: (context, snapshot) {
                animController..reset()..forward();
                return snapshot.data == null || snapshot.data is NilWidget
                    ? SizedBox.shrink()
                    : Container(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                          child: Container(
                            color: Colors.white.withOpacity(.1),
                            padding: const EdgeInsets.all(25),
                            child: SlideTransition(
                              position: slideAnimation,
                              child: Center(
                                child: snapshot.data,
                              ),
                            ),
                          ),
                        ),
                      );
              })
        ],
      ),
    );
  }
}

class BlurDialogFunction {
  final ValueChanged<Widget> show;
  final VoidCallback removeDialog;

  BlurDialogFunction({required this.show, required this.removeDialog});
}

class NilWidget extends Widget {
  @override
  Element createElement() {
    throw UnimplementedError();
  }
}
