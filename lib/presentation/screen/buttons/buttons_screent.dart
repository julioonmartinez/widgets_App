import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/router/app_router.dart';

class ButtonsScreent extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons Screen'),
      ),
      body: const _buttons_view(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          }),
    );
  }
}

class _buttons_view extends StatelessWidget {
  const _buttons_view();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated B')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated Disabled')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.access_alarm_rounded),
                label: const Text('Elevated Icon')),
            FilledButton(onPressed: () {}, child: const Text('filled button')),
            FilledButton.icon(
              onPressed: () {},
              label: Text('Filled Button Icon'),
            ),
            OutlinedButton(onPressed: () {}, child: Text('OutlineButton')),
            OutlinedButton.icon(
              onPressed: () {},
              label: Text('outline Icon'),
              icon: const Icon(Icons.outbond_sharp),
            ),
            TextButton(onPressed: () {}, child: Text('text button')),
            TextButton.icon(
              onPressed: () {},
              label: Text('text button'),
              icon: Icon(Icons.ac_unit),
            ),
            const CustomButton(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.ac_unit_outlined),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.primary),
                  iconColor: WidgetStatePropertyAll(Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text(
                'Hola Mundo',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
