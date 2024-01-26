import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedSyncColumn extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  const AnimatedSyncColumn({
    Key? key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: AnimationConfiguration.synchronized(
        duration: const Duration(milliseconds: 300),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          children: children,
        ),
      ),
    );
  }
}

class AnimatedColumn extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  const AnimatedColumn({
    Key? key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 300),
          childAnimationBuilder: (widget) =>
              AnimationConfiguration.synchronized(
            child: SlideAnimation(
              horizontalOffset: 80.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
          ),
          children: children,
        ),
      ),
    );
  }
}

class AnimatedRow extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  const AnimatedRow({
    Key? key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 600),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 80.0,
            child: FadeInAnimation(child: widget),
          ),
          children: children,
        ),
      ),
    );
  }
}

// class AnimatedGridBuilder extends StatelessWidget {
//   final EdgeInsetsGeometry padding;
//   final ScrollController scrollController;
//   final Axis scrollDirection;
//   final int itemCount;
//   final double mainAxisExtent;
//   final double crossAxisSpacing;
//   final double mainAxisSpacing;
//   final bool shrinkWrap;
//   final Widget Function(BuildContext, int) itemBuilder;
//   const AnimatedGridBuilder({
//     Key? key,
//     required this.scrollController,
//     required this.itemCount,
//     required this.itemBuilder,
//     this.scrollDirection = Axis.horizontal,
//     this.padding = project32,
//     this.mainAxisExtent = 212,
//     this.crossAxisSpacing = 32,
//     this.mainAxisSpacing = 24,
//     this.shrinkWrap = true,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AnimationLimiter(
//       child: GridView.builder(
//         padding: padding,
//         controller: scrollController,
//         scrollDirection: scrollDirection,
//         itemCount: itemCount,
//         shrinkWrap: shrinkWrap,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           mainAxisExtent: mainAxisExtent,
//           crossAxisCount: context.getGridCount(),
//           crossAxisSpacing: crossAxisSpacing,
//           mainAxisSpacing: mainAxisSpacing,
//         ),
//         itemBuilder: (context, index) => AnimationConfiguration.staggeredGrid(
//           position: index,
//           duration: const Duration(milliseconds: 375),
//           columnCount: itemCount,
//           child: ScaleAnimation(
//             child: FadeInAnimation(
//               child: YourListChild(),
//             ),
//           ),
//         ),
//       ),
//       // child: GridView.builder(
//       //   crossAxisCount: columnCount,
//       //   children: List.generate(
//       //     100,
//       //     (int index) {
//       //       return AnimationConfiguration.staggeredGrid(
//       //         position: index,
//       //         duration: const Duration(milliseconds: 375),
//       //         columnCount: columnCount,
//       //         child: ScaleAnimation(
//       //           child: FadeInAnimation(
//       //             child: YourListChild(),
//       //           ),
//       //         ),
//       //       );
//       //     },
//       //   ),
//       // ),
//     );
//   }
// }

class AnimatedListBuilder extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final bool shrinkWrap;
  final ScrollPhysics physics;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  const AnimatedListBuilder({
    Key? key,
    this.padding = EdgeInsets.zero,
    this.shrinkWrap = true,
    this.physics = const NeverScrollableScrollPhysics(),
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        padding: padding,
        itemCount: itemCount,
        shrinkWrap: shrinkWrap,
        physics: physics,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: itemBuilder(context, index),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnimatedReorderList extends StatelessWidget {
  final EdgeInsets padding;
  final bool shrinkWrap;
  final ScrollPhysics physics;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final Function(int oldIndex, int newIndex) onReorder;

  const AnimatedReorderList({
    Key? key,
    this.padding = EdgeInsets.zero,
    this.shrinkWrap = true,
    this.physics = const NeverScrollableScrollPhysics(),
    required this.itemCount,
    required this.itemBuilder,
    required this.onReorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
      child: AnimationLimiter(
        child: ReorderableListView.builder(
          padding: padding,
          itemCount: itemCount,
          shrinkWrap: shrinkWrap,
          physics: physics,
          onReorder: onReorder,
          buildDefaultDragHandles: false,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              key: ValueKey(index),
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: itemBuilder(context, index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
