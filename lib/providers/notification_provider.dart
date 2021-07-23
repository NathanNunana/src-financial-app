import 'package:fintech_app/models/notification_model.dart';
import 'package:flutter/cupertino.dart';



class NotificationProvider extends ChangeNotifier{
  List<NotificationModel> notifications = [
    NotificationModel(
      title: "Welcome Username",
      content: "All Financial Notifications regarding the SRC and the school will appear here",
      image: "assets/images/src.jpg",
      date: DateTime.now()
    ),
    NotificationModel(
      title: "Banks that have been black listed from the school",
      content: "Stanbic Bank, GT Bank, Ecobank",
      image: "assets/images/school.jpg",
      date: DateTime.now()
    ),
    NotificationModel(
      title: "Candidates for the prefectorial positions",
      content: "All candidates going for prefectorial position should pay for their transcript through the app",
      image: "assets/images/src.jpg",
      date: DateTime.now()
    ),
    NotificationModel(
      title: "Notice for payment of school fees",
      content: "Payment of fees is to be done at any other bank except for those black-listed",
      image: "assets/images/resit.jpg",
      date: DateTime.now()
    ),
    NotificationModel(
      title: "Notice: Payment of Dues",
      content: "Students yet to pay dues should do so before writing examination",
      image: "assets/images/school.jpg",
      date: DateTime.now()
    ),
    NotificationModel(
      title: "Banks that have been black listed from the school",
      content: "Stanbic Bank, GT Bank, Ecobank",
      image: "assets/images/school.jpg",
      date: DateTime.now()
    ),
    NotificationModel(
      title: "Notice: Payment of Dues",
      content: "Students yet to pay dues should do so before writing examination",
      image: "assets/images/school.jpg",
      date: DateTime.now()
    ),
  ];
}