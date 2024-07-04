import 'package:developer_guild/component/toastification.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ToastNotification.show(context, 'This is an error message', ToastType.error);
              },
              child: const Text('Show Error'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ToastNotification.show(context, 'This is a success message', ToastType.success);
              },
              child: const Text('Show Success'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ToastNotification.show(context, 'This is an info message', ToastType.info);
              },
              child: const Text('Show Info'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
