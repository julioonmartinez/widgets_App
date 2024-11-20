import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elvation 0'},
  {'elevation': 1.0, 'label': 'Elvation 1'},
  {'elevation': 2.0, 'label': 'Elvation 2'},
  {'elevation': 3.0, 'label': 'Elvation 3'},
  {'elevation': 4.0, 'label': 'Elvation 4'},
  {'elevation': 5.0, 'label': 'Elvation 5'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ...cards.map((card) =>
            _CardType1(label: card['label'], elevetation: card['elevation'])),
        ...cards.map((card) =>
            _CardType2(label: card['label'], elevetation: card['elevation'])),
        ...cards.map((card) =>
            _CardType3(label: card['label'], elevetation: card['elevation'])),
        ...cards.map((card) =>
            _CardType4(label: card['label'], elevetation: card['elevation']))
      ]),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevetation;
  const _CardType1({required this.label, required this.elevetation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevetation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevetation;
  const _CardType2({required this.label, required this.elevetation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: colors.outline)),
      elevation: elevetation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Text('$label - outline'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final String label;
  final double elevetation;
  const _CardType3({required this.label, required this.elevetation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.onSurfaceVariant,
      elevation: elevetation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Text('$label - filled'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final String label;
  final double elevetation;
  const _CardType4({required this.label, required this.elevetation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevetation,
      child: Stack(
        children: [
          Image.network(
            'http://picsum.photos/id/${elevetation.toInt()}/600/250',
            height: 350,
            fit: BoxFit.cover,
          ),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(20))),
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                ),
              )),
        ],
      ),
    );
  }
}
