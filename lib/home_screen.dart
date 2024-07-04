import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:developer_guild/component/toastification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Toastification & shimmer'),
      ),
      body: Center(
        child: _isLoading
            ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300.0,
                      height: 30.0,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 250.0,
                      height: 20.0,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 50),
                    Container(
                      width: 200.0,
                      height: 50.0,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 200.0,
                      height: 50.0,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 200.0,
                      height: 50.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Toastification Tutorial',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'This tutorial demonstrates how to use the Toastification package '
                      'to show different types of toast notifications such as error, success, '
                      'and info messages.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 80),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              ToastNotification.show(
                                context,
                                'This is an error message',
                                ToastType.error,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(200, 50),
                            ),
                            child: const Text('Show Error'),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              ToastNotification.show(
                                context,
                                'This is a success message',
                                ToastType.success,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(200, 50),
                            ),
                            child: const Text('Show Success'),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              ToastNotification.show(
                                context,
                                'This is an info message',
                                ToastType.info,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(200, 50),
                            ),
                            child: const Text('Show Info'),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _startLoading,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(200, 50),
                            ),
                            child: const Text('Shimmer'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
