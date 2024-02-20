import 'package:idi_rabotai123/data/vacancy.dart';

class Response {
  Vacancy? vacancy;
  bool? status;
  DateTime? date;

  Response({this.vacancy, this.status, this.date});
}

List<Response> responseList = [
  Response(vacancy: vacancyList[0], status: false, date: DateTime.now()),
  Response(vacancy: vacancyList[1], status: false, date: DateTime.now()),
  Response(vacancy: vacancyList[4], status: true, date: DateTime.now()),
];