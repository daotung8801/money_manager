import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:launch_review/launch_review.dart';

class PopUpRatingApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return RatingDialog(
      initialRating: 1.0,
      title: Text(
        'Đánh giá app',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Vui lòng đánh giá chúng tôi năm sao trong Google Play!',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
      ),
      // your app's logo?
      // image: const FlutterLogo(size: 100),
      image: Image.asset("assets/appIcon.png"),
      submitButtonText: 'Gửi',
      submitButtonTextStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 35, 111, 87),
      ),
      commentHint: 'Mô tả trải nghiệm của bạn',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');
        LaunchReview.launch(
          androidAppId: 'ru.innim.my_finance',
        );
      },
    );
  }
}
