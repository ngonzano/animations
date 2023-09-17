// import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

// import 'package:flutter/rendering.dart';

Duration _duration = const Duration(milliseconds: 3500);

class Implicita extends StatefulWidget {
  const Implicita({super.key});

  @override
  State<Implicita> createState() => _ImplicitaState();
}

class _ImplicitaState extends State<Implicita> {
  bool isFullSize = false;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        // appBar: AppBar(),
        body: Center(
          child: GestureDetector(
              onTap: () {
                setState(() {
                  isFullSize = !isFullSize;
                });
              },
              // child: ContainerAnimado(isFullSize: isFullSize, size: size),
              // child: AnimacionCambioWidget(size: size, isFullSize: isFullSize),
              // child: AnimacionAlign(isFullSize: isFullSize, size: size),
              // child: PosicionAnimada(isFullSize: isFullSize, size: size),
              // child: AnimacionBuilder(isFullSize: isFullSize, size: size),
              // child: const AnimacionDecoratedBoxTransition(),
              // child: const AnimacionFadeTransition(),
              // child: const AnimacionPositionedTransition(),
              // child: const AnimacionRotationTransition(),
              // child: const AnimacionScaleTransition(),
              // child: const AnimacionSizeTransition(),
              // child: const AnimacionSlideTransition(),
              // child: const AnimacionDefaultTextStyle(),
              // child: AnimacionList(),
              // child: const AnimacionModalBarrier(),
              // child: const AnimacionPadding(),
              // child: const AnimacionPhysicalModel(),
              // child: const AnimacionSize(),
              // child: _AnimatedWidgetExample(),
              // child: const AnimacionRotation(),
              // child: const AnimacionSwitcher(),
              // child: const WidgetNuevos(),
              // child: const AutoCompletar(),
              child: Banner(
                location: BannerLocation.topEnd,
                message: 'Oferta',
                child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        color: Colors.transparent,
                        child: GridPaper(
                          interval: 150,
                          divisions: 5,
                          subdivisions: 15,
                          color: Colors.red,
                          child: CloseButton(
                            color: Colors.red.shade50,
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        child: GridPaper(
                          interval: 150,
                          divisions: 5,
                          subdivisions: 15,
                          color: Colors.blue,
                          child: CloseButton(
                            color: Colors.red.shade50,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class AutoCompletar extends StatelessWidget {
  const AutoCompletar({
    super.key,
  });

  static const List<String> listITems = <String>[
    'apple',
    'banana',
    'melon',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Colors.black12,
          width: double.infinity,
          height: 50,
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return listITems.where((String item) {
                return item.contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String item) {
              print('selected: $item');
            },
          ),
        ),
      ],
    );
  }
}

class WidgetNuevos extends StatelessWidget {
  const WidgetNuevos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      alignment: Alignment.center,
      width: double.infinity,
      height: 300,
      child: AspectRatio(
        aspectRatio: 7 / 3,
        child: Container(
          color: Colors.teal,
        ),
      ),
    );
  }
}

class AnimacionSwitcher extends StatefulWidget {
  const AnimacionSwitcher({
    super.key,
  });

  @override
  State<AnimacionSwitcher> createState() => _AnimacionSwitcherState();
}

class _AnimacionSwitcherState extends State<AnimacionSwitcher> {
  int count = 0;
  bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: AnimatedOpacity(
              key: ValueKey(count),
              duration: const Duration(milliseconds: 500),
              opacity: isTrue ? 0.5 : 1.0,
              child: Text(
                "$count",
                style: const TextStyle(fontSize: 45),
                key: ValueKey(count),
              ),
            ),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                isTrue = !isTrue;
                count++;
              });
            },
            child: const Text(
              'Add',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

//no convence la animacion del modal
class AnimacionModalBarrier extends StatefulWidget {
  const AnimacionModalBarrier({
    super.key,
  });

  @override
  State<AnimacionModalBarrier> createState() => _AnimacionModalBarrierState();
}

class _AnimacionModalBarrierState extends State<AnimacionModalBarrier>
    with SingleTickerProviderStateMixin {
  bool isPreseed = false;
  late Widget animatedModalBarrier;

  late AnimationController animationController;
  late Animation<Color?> colorAnimation;
  @override
  void initState() {
    ColorTween colorTween = ColorTween(
      begin: Colors.deepPurple.withOpacity(0.5),
      end: Colors.blue.withOpacity(0.5),
    );

    animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );
    colorAnimation = colorTween.animate(animationController);
    animatedModalBarrier = AnimatedModalBarrier(
      color: colorAnimation,
      dismissible: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 250,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  MaterialButton(
                    color: Colors.pinkAccent,
                    onPressed: () {
                      setState(
                        () {
                          isPreseed = true;
                        },
                      );
                      animationController.reset();
                      animationController.forward();
                      Future.delayed(_duration, () {
                        setState(() {
                          isPreseed = false;
                        });
                      });
                    },
                    child: const Text('Press to start'),
                  ),
                  if (isPreseed) animatedModalBarrier,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AnimacionList extends StatefulWidget {
  const AnimacionList({
    super.key,
  });

  @override
  State<AnimacionList> createState() => _AnimacionListState();
}

class _AnimacionListState extends State<AnimacionList> {
  final items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void addItem() {
    items.insert(0, '${items.length + 1}');
    _key.currentState!.insertItem(
      0,
      duration: const Duration(milliseconds: 500),
    );
  }

  void removeItem(int index) {
    _key.currentState!.removeItem(
      index,
      (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            margin: EdgeInsets.all(8),
            color: Colors.red,
            child: ListTile(
              title: Text(
                'Eliminar',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 300),
    );
    items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar,
      body: Column(
        children: [
          IconButton(onPressed: addItem, icon: const Icon(Icons.add)),
          Expanded(
            child: AnimatedList(
              key: _key,
              initialItemCount: 0,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  key: UniqueKey(),
                  sizeFactor: animation,
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    color: Colors.blue,
                    child: ListTile(
                      title: Text(
                        items[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            removeItem(index);
                          },
                          icon: const Icon(Icons.delete_forever)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AnimacionPositioned extends StatelessWidget {
  const AnimacionPositioned({
    super.key,
    required this.isFullSize,
    required this.size,
  });

  final bool isFullSize;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: _duration,
          top: isFullSize ? 50 : 250,
          bottom: isFullSize ? 250 : 50,
          left: isFullSize ? 50 : 200,
          right: isFullSize ? 200 : 50,
          // right: isFullSize ? 50 : 150,
          child: AnimacionContainer(
            isFullSize: isFullSize,
            size: size,
          ),
        ),
      ],
    );
  }
}

class AnimacionAlign extends StatelessWidget {
  const AnimacionAlign({
    super.key,
    required this.isFullSize,
    required this.size,
  });

  final bool isFullSize;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: isFullSize ? Alignment.center : Alignment.bottomLeft,
      duration: _duration,
      child: AnimatedContainer(
        margin: EdgeInsets.all(isFullSize ? 0 : 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isFullSize ? 30 : 50),
          color: isFullSize ? Colors.deepPurple : Colors.deepPurple.shade300,
        ),
        width: isFullSize ? size.height * 0.2 : size.width * 0.1,
        height: isFullSize ? size.height * 0.2 : size.width * 0.1,
        duration: _duration,
      ),
    );
  }
}

class AnimacionCrossFade extends StatelessWidget {
  const AnimacionCrossFade({
    super.key,
    required this.size,
    required this.isFullSize,
  });

  final Size size;
  final bool isFullSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: _duration,
      firstChild: FlutterLogo(
        style: FlutterLogoStyle.horizontal,
        size: size.width,
      ),
      secondChild: FlutterLogo(
        style: FlutterLogoStyle.stacked,
        size: size.width,
      ),
      crossFadeState:
          isFullSize ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

class AnimacionContainer extends StatelessWidget {
  const AnimacionContainer({
    super.key,
    required this.isFullSize,
    required this.size,
  });

  final bool isFullSize;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isFullSize ? 20 : 50),
        gradient: LinearGradient(
          colors: [
            isFullSize
                ? Colors.deepPurple.shade800
                : Colors.deepPurple.shade100,
            isFullSize
                ? Colors.deepPurple.shade100
                : Colors.deepPurple.shade800,
          ],
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: isFullSize ? 15 : 40,
            color: isFullSize ? Colors.black : Colors.deepPurple.shade800,
            blurStyle: BlurStyle.solid,
          )
        ],
      ),
      alignment: isFullSize ? Alignment.topCenter : Alignment.bottomCenter,
      curve: Curves.bounceOut,
      duration: _duration,
      width: isFullSize ? size.width * 0.3 : size.width * 0.4,
      height: isFullSize ? size.width * 0.3 : size.height * 0.4,
      child: AnimatedOpacity(
        curve: Curves.bounceInOut,
        duration: _duration,
        opacity: isFullSize ? 0.5 : 1,
        child: const Padding(
          padding: EdgeInsets.all(28.0),
          child: Text(
            'test',
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}

//Animacion explicita
//1
class AnimacionBuilder extends StatefulWidget {
  const AnimacionBuilder({
    super.key,
    required this.size,
    required this.isFullSize,
  });
  final Size size;
  final bool isFullSize;

  @override
  State<AnimacionBuilder> createState() => _AnimacionBuilderState();
}

class _AnimacionBuilderState extends State<AnimacionBuilder>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: _duration,
    vsync: this,
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: AnimatedContainer(
        decoration: BoxDecoration(
            color: widget.isFullSize ? Colors.blue : Colors.deepPurple.shade300,
            borderRadius: BorderRadius.circular(widget.isFullSize ? 10 : 100)),
        width: widget.isFullSize ? 100 : 200.0,
        height: widget.isFullSize ? 100 : 200.0,
        duration: _duration,
        child: const Center(
          child: Icon(
            Icons.add_circle,
            size: 50,
          ),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        // print(_controller.value);
        return Transform.rotate(
          angle: _controller.value * 2.0 * math.pi,
          child: child,
        );
      },
    );
  }
}

//2
class AnimacionDecoratedBoxTransition extends StatefulWidget {
  const AnimacionDecoratedBoxTransition({super.key});

  @override
  State<AnimacionDecoratedBoxTransition> createState() =>
      _AnimacionDecoratedBoxTransitionState();
}

class _AnimacionDecoratedBoxTransitionState
    extends State<AnimacionDecoratedBoxTransition>
    with TickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Colors.blue,
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(60.0),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Colors.deepPurple,
          blurRadius: 10.0,
          spreadRadius: 3.0,
          offset: Offset(0, 6.0),
        ),
      ],
    ),
    end: BoxDecoration(
      color: Colors.green,
      border: Border.all(
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.circular(20.0),
      // No shadow.
    ),
  );

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBoxTransition(
        decoration: decorationTween.animate(_controller),
        child: Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(10),
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}

//3
class AnimacionFadeTransition extends StatefulWidget {
  const AnimacionFadeTransition({super.key});

  @override
  State<AnimacionFadeTransition> createState() =>
      _AnimacionFadeTransitionState();
}

class _AnimacionFadeTransitionState extends State<AnimacionFadeTransition>
    with TickerProviderStateMixin {
  ///
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  ///
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceInOut,
  );

  ///
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animation,
        child: const Padding(
            padding: EdgeInsets.all(8),
            child: FlutterLogo(
              size: 200,
            )),
      ),
    );
  }
}

//4
class AnimacionPositionedTransition extends StatefulWidget {
  const AnimacionPositionedTransition({super.key});

  @override
  State<AnimacionPositionedTransition> createState() =>
      _AnimacionPositionedTransitionState();
}

class _AnimacionPositionedTransitionState
    extends State<AnimacionPositionedTransition> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double smallLogo = 100;
    const double bigLogo = 200;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Size biggest = constraints.biggest;
        return Stack(
          children: <Widget>[
            PositionedTransition(
              rect: RelativeRectTween(
                begin: RelativeRect.fromSize(
                  const Rect.fromLTWH(0, 0, smallLogo, smallLogo),
                  biggest,
                ),
                end: RelativeRect.fromSize(
                  Rect.fromLTWH(biggest.width - bigLogo,
                      biggest.height - bigLogo, bigLogo, bigLogo),
                  biggest,
                ),
              ).animate(CurvedAnimation(
                parent: _controller,
                curve: Curves.elasticInOut,
              )),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: FlutterLogo(),
              ),
            ),
          ],
        );
      },
    );
  }
}

//5
class AnimacionRotationTransition extends StatefulWidget {
  const AnimacionRotationTransition({super.key});

  @override
  State<AnimacionRotationTransition> createState() =>
      _AnimacionRotationTransitionState();
}

class _AnimacionRotationTransitionState
    extends State<AnimacionRotationTransition> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(size: 150.0),
          ),
        ),
      ),
    );
  }
}

//6
class AnimacionScaleTransition extends StatefulWidget {
  const AnimacionScaleTransition({super.key});

  @override
  State<AnimacionScaleTransition> createState() =>
      _AnimacionScaleTransitionState();
}

class _AnimacionScaleTransitionState extends State<AnimacionScaleTransition>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(size: 150.0),
          ),
        ),
      ),
    );
  }
}

//7
class AnimacionSizeTransition extends StatefulWidget {
  const AnimacionSizeTransition({super.key});

  @override
  State<AnimacionSizeTransition> createState() =>
      _AnimacionSizeTransitionState();
}

class _AnimacionSizeTransitionState extends State<AnimacionSizeTransition>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.horizontal,
        axisAlignment: -1,
        child: const Center(
          child: FlutterLogo(size: 200.0),
        ),
      ),
    );
  }
}

//8
class AnimacionSlideTransition extends StatefulWidget {
  const AnimacionSlideTransition({super.key});

  @override
  State<AnimacionSlideTransition> createState() =>
      _AnimacionSlideTransitionState();
}

class _AnimacionSlideTransitionState extends State<AnimacionSlideTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FlutterLogo(size: 150.0),
      ),
    );
  }
}

//9
class AnimacionDefaultTextStyle extends StatefulWidget {
  const AnimacionDefaultTextStyle({Key? key}) : super(key: key);

  @override
  State<AnimacionDefaultTextStyle> createState() =>
      _AnimacionDefaultTextStyleState();
}

class _AnimacionDefaultTextStyleState extends State<AnimacionDefaultTextStyle> {
  bool _first = true;
  double _fontSize = 40;
  Color _color = Colors.cyan;
  double height = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 210,
            child: AnimatedDefaultTextStyle(
              curve: Curves.bounceOut,
              duration: const Duration(milliseconds: 350),
              style: TextStyle(
                fontSize: _fontSize,
                color: _color,
                fontWeight: FontWeight.bold,
              ),
              child: const Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("Flutter Dev's"),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 150,
            child: MaterialButton(
              // style: ElevatedButton.styleFrom(
              //     primary: Colors.cyan,
              //     textStyle: const TextStyle(
              //         fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: () {
                setState(() {
                  _fontSize = _first ? 60 : 40;
                  _color = _first ? Colors.blue : Colors.brown;
                  _first = !_first;
                  height = _first ? 100 : 130;
                });
              },
              child: const Text(
                "Click Here!!",
              ),
            ),
          )
        ],
      ),
    );
  }
}

//10
class AnimacionPhysicalModel extends StatefulWidget {
  const AnimacionPhysicalModel({
    super.key,
  });

  @override
  State<AnimacionPhysicalModel> createState() => _AnimacionPhysicalModelState();
}

class _AnimacionPhysicalModelState extends State<AnimacionPhysicalModel> {
  bool isFlat = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedPhysicalModel(
            shape: BoxShape.circle,
            elevation: isFlat ? 15 : 0,
            color: Colors.deepPurple,
            curve: Curves.fastOutSlowIn,
            shadowColor: Colors.red,
            duration: const Duration(milliseconds: 500),
            child: const SizedBox(
              height: 100,
              width: 100,
              child: Icon(
                Icons.flutter_dash,
                size: 80,
              ),
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            child: Text('$isFlat'),
            onPressed: () {
              setState(() {
                isFlat = !isFlat;
              });
            },
          )
        ],
      ),
    );
  }
}

//11
class AnimacionSize extends StatefulWidget {
  const AnimacionSize({super.key});

  @override
  State<AnimacionSize> createState() => _AnimacionSizeState();
}

class _AnimacionSizeState extends State<AnimacionSize> {
  double _size = 50.0;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 250.0 : 100.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _updateSize(),
      child: ColoredBox(
        color: Colors.amberAccent,
        child: AnimatedSize(
          curve: Curves.easeIn,
          duration: const Duration(seconds: 1),
          child: FlutterLogo(size: _size),
        ),
      ),
    );
  }
}

//12
class _AnimatedWidgetExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedWidgetExampleState();
}

class _AnimatedWidgetExampleState extends State<_AnimatedWidgetExample>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotatingSquare(controller: _controller),
      ),
    );
  }
}

class RotatingSquare extends AnimatedWidget {
  const RotatingSquare({
    Key? key,
    required AnimationController controller,
  }) : super(
          key: key,
          listenable: controller,
        );

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    // print(_progress.value);
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.teal,
        child: const Center(
          child: Text(
            'girando',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}

//13
class AnimacionRotation extends StatefulWidget {
  const AnimacionRotation({
    super.key,
  });

  @override
  State<AnimacionRotation> createState() => _AnimacionRotationState();
}

class _AnimacionRotationState extends State<AnimacionRotation> {
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: AnimatedRotation(
                turns: turns,
                duration: const Duration(milliseconds: 2000),
                child: const FlutterLogo(size: 100),
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  turns += 1 / 4;
                });
              },
              color: Colors.red,
              child: const Text('Rotar'),
            )
          ],
        ),
      ),
    );
  }
}

//14
class AnimacionPadding extends StatefulWidget {
  const AnimacionPadding({
    super.key,
  });

  @override
  State<AnimacionPadding> createState() => _AnimacionPaddingState();
}

class _AnimacionPaddingState extends State<AnimacionPadding> {
  double padValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              setState(() {
                padValue = padValue == 0.0 ? 100.0 : 0.0;
              });
            },
            color: Colors.deepPurple,
            child: const Text('Start'),
          ),
          Text('Padding = $padValue'),
          AnimatedPadding(
            padding: EdgeInsets.all(padValue),
            duration: _duration,
            curve: Curves.bounceInOut,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
