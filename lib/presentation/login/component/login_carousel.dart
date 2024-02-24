part of '../login_worker.dart';

class _Carousel extends StatelessWidget {
  final LoginBloc bloc;
  _Carousel({required this.bloc});

  final images = [
    Assets.image.ayamSlide1.path,
    Assets.image.ayamSlide2.path,
    Assets.image.ayamSlide3.path,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizer.fix_width * 0.25,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider.builder(
            itemCount: images.length,
            options: CarouselOptions(
              height: Sizer.fix_height * 0.6,
              autoPlayInterval: const Duration(seconds: 5),
              viewportFraction: 1.0,
              autoPlay: true,
              onPageChanged: (index, page) => bloc.slide(index),
            ),
            itemBuilder: (context, index, realIndex) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Obx(() {
                return AnimatedSmoothIndicator(
                  count: images.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Color.fromRGBO(255, 255, 255, 0.5),
                    activeDotColor: Colors.white,
                    dotHeight: 7,
                    dotWidth: 7,
                    strokeWidth: 1,
                  ),
                  activeIndex: bloc.slide.value,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
