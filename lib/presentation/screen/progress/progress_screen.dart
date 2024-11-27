import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'ProgressScreen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicators'),
      ),
      body: _progressView(),
    );
  }
}

class _progressView extends StatelessWidget {
  const _progressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text('Circular Progress Indicator'),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.black45,
            backgroundColor: Colors.amberAccent,
          ),
          SizedBox(
            height: 20,
          ),
          Text('Progress indicator controlado'),
          SizedBox(
            height: 20,
          ),
          _ControllerProgressIndicator()
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 2,
                value: progressValue,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: LinearProgressIndicator(
                value: progressValue,
              ))
            ],
          ),
        );
      },
    );
  }
}
