import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'SnackbarScreen';

  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: Text('Hola Mundo'),
      action: SnackBarAction(label: 'ok', onPressed: () {}),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro'),
        content: const Text(
            'Veniam sit consequat adipisicing qui aliqua irure irure reprehenderit cillum magna quis aliqua. Incididunt nostrud dolor adipisicing Lorem duis minim exercitation duis. Pariatur reprehenderit pariatur sint deserunt aute amet ex ad quis. Exercitation labore commodo ut anim et aute nostrud proident nisi magna ipsum dolor laboris. Sint est eiusmod elit mollit sint veniam reprehenderit.'),
        actions: [
          TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBar y diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Elit sint non mollit cupidatat non anim incididunt aliqua consequat laboris qui. Proident reprehenderit deserunt ad dolore tempor cupidatat ipsum consequat id exercitation tempor consequat magna anim. Non enim eu culpa magna dolore occaecat sunt ea. Sint velit ex amet minim excepteur do.')
                  ]);
                },
                child: Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: Text('Mostrar Dialoo'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: Text('Mostrar SnackBar'),
          icon: Icon(Icons.remove_red_eye_outlined),
          onPressed: () => showCustomSnackBar(context)),
    );
  }
}
