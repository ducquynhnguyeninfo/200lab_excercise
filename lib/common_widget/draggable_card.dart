import 'dart:math';

import 'package:flutter/material.dart';

enum SlideDirection {
  left,
  right,
  up,
}

enum Decision {
  undecided,
  nope,
  like,
  superLike,
}

class DraggableCard extends StatefulWidget {
  final Widget? card;
  final bool? isDraggable;
  final SlideDirection? slideTo;
  final Function(double distance)? onSlideUpdate;
  final Function(SlideDirection direction)? onSlideOutComplete;

  DraggableCard({
    Key? key,
    this.card,
    this.isDraggable = true,
    this.slideTo,
    this.onSlideUpdate,
    this.onSlideOutComplete,
  }) : super(key: key);

  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with TickerProviderStateMixin {
  Decision? decision;
  GlobalKey profileCardKey = GlobalKey(debugLabel: 'profile_card_key');
  Offset cardOffset = const Offset(0.0, 0.0);
  Offset? dragStart;
  Offset? dragPosition;
  Offset? slideBackStart;
  SlideDirection? slideOutDirection;
  AnimationController? slideBackAnimation;
  Tween<Offset>? slideOutTween;
  AnimationController? slideOutAnimation;
  double _iconOpacity = 0;
  Widget _icon = Container();

  @override
  void initState() {
    super.initState();
    slideBackAnimation = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )
      ..addListener(() => setState(() {
            cardOffset = Offset.lerp(
              slideBackStart,
              const Offset(0.0, 0.0),
              Curves.elasticOut.transform(slideBackAnimation!.value),
            )!;

            if (null != widget.onSlideUpdate) {
              widget.onSlideUpdate!(cardOffset.distance);
            }
          }))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            dragStart = null;
            slideBackStart = null;
            dragPosition = null;
          });
        }
      });

    slideOutAnimation = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )
      ..addListener(() {
        setState(() {
          cardOffset = slideOutTween!.evaluate(slideOutAnimation!);

          if (null != widget.onSlideUpdate) {
            widget.onSlideUpdate!(cardOffset.distance);
          }
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            dragStart = null;
            dragPosition = null;
            slideOutTween = null;

            if (widget.onSlideOutComplete != null) {
              widget.onSlideOutComplete!(slideOutDirection!);
            }
          });
        }
      });
  }

  @override
  void didUpdateWidget(DraggableCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.card?.key != oldWidget.card?.key) {
      cardOffset = const Offset(0.0, 0.0);
      _icon = Container();
      _iconOpacity = 0;
    }
    // if (widget.isDraggable)
    //   print(oldWidget.slideTo.toString() + " --- " + widget.slideTo.toString());

    if (oldWidget.slideTo == null && widget.slideTo != null) {
      switch (widget.slideTo) {
        case SlideDirection.left:
          slideOutDirection = SlideDirection.left;
          _slideLeft();
          break;
        case SlideDirection.right:
          slideOutDirection = SlideDirection.right;
          _slideRight();
          break;
        case SlideDirection.up:
          slideOutDirection = SlideDirection.up;
          _slideUp();
          break;
      }
    }
  }

  @override
  void dispose() {
    slideBackAnimation?.dispose();
    super.dispose();
  }

  Offset _chooseRandomDragStart() {
    final cardContext = profileCardKey.currentContext;
    final cardTopLeft = (cardContext!.findRenderObject() as RenderBox)
        .localToGlobal(const Offset(0.0, 0.0));
    final dragStartY = cardContext.size!.height *
            (new Random().nextDouble() < 0.5 ? 0.25 : 0.75) +
        cardTopLeft.dy;
    return new Offset(cardContext.size!.width / 2 + cardTopLeft.dx, dragStartY);
  }

  void _slideLeft() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final screenWidth = context.size!.width;
      dragStart = _chooseRandomDragStart();
      slideOutTween = new Tween(
          begin: const Offset(0.0, 0.0),
          end: new Offset(-2 * screenWidth, 0.0));
      slideOutAnimation?.forward(from: 0.0);
    });
  }

  void _slideRight() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final screenWidth = context.size!.width;
      dragStart = _chooseRandomDragStart();
      slideOutTween = new Tween(
          begin: const Offset(0.0, 0.0), end: new Offset(2 * screenWidth, 0.0));
      slideOutAnimation?.forward(from: 0.0);
    });
  }

  void _slideUp() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final screenHeight = context.size!.height;
      dragStart = _chooseRandomDragStart();
      slideOutTween = new Tween(
          begin: const Offset(0.0, 0.0),
          end: new Offset(0.0, -2 * screenHeight));
      slideOutAnimation?.forward(from: 0.0);
    });
  }

  void _onPanStart(DragStartDetails details) {
    dragStart = details.globalPosition;

    if (slideBackAnimation?.isAnimating ?? false) {
      slideBackAnimation?.stop(canceled: true);
    }
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (widget.isDraggable ?? false) {
      final isInLeftRegion = _isInLeft;
      final isInRightRegion = _isInRight;
      final isInTopRegion = _isInTop;
      final double opacity = cardOffset.distance.roundToDouble() / 100;

      setState(() {
        dragPosition = details.globalPosition;
        cardOffset = dragPosition! - dragStart!;

        if (null != widget.onSlideUpdate) {
          widget.onSlideUpdate!(cardOffset.distance);
        }
        if (opacity < 0.15) {
          _iconOpacity = 0;
        } else if (opacity > 1) {
          _iconOpacity = 1;
        } else {
          _iconOpacity = opacity;
        }
        // if (isInLeftRegion) {
        //   _icon = Icon(
        //     Icons.arrow_back,
        //     size: 100,
        //     color: Colors.white,
        //   );
        // } else
        if (isInRightRegion) {
          // _icon = Image.asset(
          //   'assets/icons/like.png',
          //   width: 120,
          //   height: 120,
          // );
          _icon = Container();
        }
        // else if (isInTopRegion) {
        //   _icon = Icon(
        //     Icons.arrow_upward,
        //     size: 100,
        //     color: Colors.white,
        //   );
        // }
        else {
          _icon = Container();
        }
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (widget.isDraggable ?? false) {
      final dragVector = cardOffset / cardOffset.distance;
      final isInLeftRegion = _isInLeftRegion;
      final isInRightRegion = _isInRightRegion;
      final isInTopRegion = _isInTopRegion;

      setState(() {
        if (isInLeftRegion || isInRightRegion) {
          slideOutTween = new Tween(
              begin: cardOffset, end: dragVector * (2 * context.size!.width));
          slideOutAnimation?.forward(from: 0.0);

          slideOutDirection =
              isInLeftRegion ? SlideDirection.left : SlideDirection.right;
        } else if (isInTopRegion) {
          slideOutTween = new Tween(
              begin: cardOffset, end: dragVector * (2 * context.size!.height));
          slideOutAnimation?.forward(from: 0.0);

          slideOutDirection = SlideDirection.up;
        } else {
          slideBackStart = cardOffset;
          slideBackAnimation?.forward(from: 0.0);
          _iconOpacity = 0;
          _icon = Container();
        }
      });
    }
  }

  bool get _isInLeftRegion => (cardOffset.dx / context.size!.width) < -0.35;
  bool get _isInRightRegion => (cardOffset.dx / context.size!.width) > 0.35;
  bool get _isInTopRegion => (cardOffset.dy / context.size!.height) < -0.30;

  bool get _isInLeft => (cardOffset.dx / context.size!.width) < -0.05;
  bool get _isInRight => (cardOffset.dx / context.size!.width) > 0.05;
  bool get _isInTop => (cardOffset.dy / context.size!.height) < -0.05;

  double _rotation(Rect dragBounds) {
    if (dragStart != null) {
      final rotationCornerMultiplier =
          dragStart!.dy >= dragBounds.top + (dragBounds.height / 2) ? -1 : 1;
      return (pi / 8) *
          (cardOffset.dx / dragBounds.width) *
          rotationCornerMultiplier;
    } else {
      return 0.0;
    }
  }

  Offset _rotationOrigin(Rect dragBounds) {
    if (dragStart != null) {
      return dragStart! - dragBounds.topLeft;
    } else {
      return const Offset(0.0, 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        RenderBox box = context.findRenderObject() as RenderBox;
        Rect anchorBounds =
            Rect.fromLTRB(0, 0, constrains.maxWidth, constrains.maxHeight);
        if (box.hasSize) {
          final topLeft = box.size.topLeft(const Offset(0.0, 0.0));
          final bottomRight = box.size.bottomRight(const Offset(0.0, 0.0));
          anchorBounds = new Rect.fromLTRB(
            topLeft.dx,
            topLeft.dy,
            bottomRight.dx,
            bottomRight.dy,
          );
        }

        return Transform(
          transform:
              Matrix4.translationValues(cardOffset.dx, cardOffset.dy, 0.0)
                ..rotateZ(_rotation(anchorBounds)),
          origin: _rotationOrigin(anchorBounds),
          child: Container(
            key: profileCardKey,
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
              onPanEnd: _onPanEnd,
              child: Stack(
                children: <Widget>[
                  widget.card!,
                  Center(
                    child: Opacity(
                      opacity: _iconOpacity,
                      child: _icon,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
