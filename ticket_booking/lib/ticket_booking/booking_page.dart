import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/ticket_booking/booking_controller.dart';

class BookingPage extends StatelessWidget {
  BookingPage({super.key});
  BookingController controller = Get.find<BookingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Booking'),
        ),
        body: Column(
          children: [
            Obx(() {
              return Text(
                  'Available: ${controller.limit.value - controller.booked.value}');
            }),
            TextField(
              controller: controller.txtName,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: controller.txtCount,
              decoration: InputDecoration(
                labelText: 'Ticket Count',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.bookTicket();
              },
              child: Text('Save'),
            ),
          ],
        ));
  }
}
