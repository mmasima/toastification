import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

enum ToastType { error, success, info }

class ToastNotification {
  static void show(BuildContext context, String message, ToastType type) {
    Widget title;
    IconData icon;
    Color primaryColor;
    Color backgroundColor;

    switch (type) {
      case ToastType.success:
        title = const Text('Success');
        icon = Icons.check_circle;
        primaryColor = Colors.green;
        backgroundColor = Colors.white;
        break;
      case ToastType.error:
        title = const Text('Error');
        icon = Icons.error;
        primaryColor = Colors.red;
        backgroundColor = Colors.white;
        break;
      case ToastType.info:
        title = const Text('Info');
        icon = Icons.info;
        primaryColor = Colors.blue;
        backgroundColor = Colors.white;
        break;
      default:
        title = const Text('Info');
        icon = Icons.info;
        primaryColor = Colors.blue;
        backgroundColor = Colors.white;
        break;
    }

    toastification.show(
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomRight,
      context: context,
      type: _mapToastTypeToToastificationType(type),
      autoCloseDuration: const Duration(seconds: 5),
      title: Row(
        children: [
          Icon(icon, color: primaryColor),
          const SizedBox(width: 8),
          title,
        ],
      ),
      description: RichText(
        text: TextSpan(
          text: message,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) => print('Toast ${toastItem.id} close button tapped'),
        onAutoCompleteCompleted: (toastItem) => print('Toast ${toastItem.id} auto complete completed'),
        onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
      ),
    );
  }

  static ToastificationType _mapToastTypeToToastificationType(ToastType type) {
    switch (type) {
      case ToastType.success:
        return ToastificationType.success;
      case ToastType.error:
        return ToastificationType.error;
      case ToastType.info:
        return ToastificationType.info;
      default:
        return ToastificationType.info;
    }
  }
}
