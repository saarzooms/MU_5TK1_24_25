import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/ticket_booking/booking_model.dart';

class BookingController extends GetxController {
  var limit = 0.obs;
  var booked = 0.obs;
  var price = 0.0.obs;
  RxList<BookingModel> bookings = RxList.empty();

  TextEditingController txtLimit = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtCount = TextEditingController();
  saveSettings() {
    limit.value = int.parse(txtLimit.text);
    price.value = double.parse(txtPrice.text);
  }

  bookTicket() {}
}
