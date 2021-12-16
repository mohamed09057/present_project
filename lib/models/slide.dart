import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/image1.png',
    title: 'مرحبا بك',
    description: 'تطبيق حاضر هو لمتابعة حضور الطالب بأسهل واحدث طريقة ممكنة ',
  ),
  Slide(
    imageUrl: 'assets/images/image2.png',
    title: 'تطبيق مجاني',
    description:
        'تستطيع تحميل التطبيق في اي وقت للاستفادة منه كما انه متوفر مجانا ',
  ),
  Slide(
    imageUrl: 'assets/images/image3.png',
    title: 'سهولة متابعة البيانات',
    description:
        'معرفة حالتك الحضورية  خلال الفصل الدراسي من خلال التطبيق دون الحاجة للرجوع الى ادارة الكلية او الاستاد',
  ),
];
