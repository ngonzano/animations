import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height * 0.4,
        decoration: BoxDecoration(
            color: Colors.green.shade900,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(80),
              bottomLeft: Radius.circular(80),
            )),
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SwiperPersonalized(),
            ),
          ),
        ),
      ),
    );
  }
}

class SwiperPersonalized extends StatelessWidget {
  const SwiperPersonalized({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: 3,
      layout: SwiperLayout.STACK,
      pagination: SwiperCustomPagination(builder: (_, config) {
        return Center(
          child: Text(
            '${config.activeIndex}',
            style: const TextStyle(color: Colors.black),
          ),
        );
      }),
      itemWidth: 400,
      itemHeight: 225,
      loop: true,
      duration: 1200,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(20)),
        );
      },
    );
  }
}
