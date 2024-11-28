import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'UiControlsScreen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarin }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  Transportation selectedTranspotation = Transportation.car;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        ExpansionTile(
          title: const Text('Type of transport'),
          subtitle: Text('$selectedTranspotation'),
          children: [
            RadioListTile(
                title: const Text('By car'),
                subtitle: const Text('Travel by car '),
                value: Transportation.car,
                groupValue: selectedTranspotation,
                onChanged: (value) => setState(() {
                      selectedTranspotation = Transportation.car;
                    })),
            RadioListTile(
                title: const Text('By boat'),
                subtitle: const Text('Travel by boat '),
                value: Transportation.boat,
                groupValue: selectedTranspotation,
                onChanged: (value) => setState(() {
                      selectedTranspotation = Transportation.boat;
                    })),
            RadioListTile(
                title: const Text('By plane'),
                subtitle: const Text('Travel by plane'),
                value: Transportation.plane,
                groupValue: selectedTranspotation,
                onChanged: (value) => setState(() {
                      selectedTranspotation = Transportation.plane;
                    })),
            RadioListTile(
                title: const Text('By submarine'),
                subtitle: const Text('Travel by submarine'),
                value: Transportation.submarin,
                groupValue: selectedTranspotation,
                onChanged: (value) => setState(() {
                      selectedTranspotation = Transportation.submarin;
                    })),
          ],
        ),
        CheckboxListTile(
            title: const Text('Wants Breakfast?'),
            value: wantsBreakfast,
            onChanged: (value) => setState(() {
                  wantsBreakfast = !wantsBreakfast;
                })),
        CheckboxListTile(
            title: const Text('Wants Lunch?'),
            value: wantsLunch,
            onChanged: (value) => setState(() {
                  wantsLunch = !wantsLunch;
                })),
        CheckboxListTile(
            title: const Text('Wants Dinner?'),
            value: wantsDinner,
            onChanged: (value) => setState(() {
                  wantsDinner = !wantsDinner;
                }))
      ],
    );
  }
}
