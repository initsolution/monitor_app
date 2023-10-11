import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/controller/app_provider.dart';
import 'package:monitor_app/screen/temuan_item_card.dart';

class TemuanScreen extends ConsumerStatefulWidget {
  const TemuanScreen({super.key});

  @override
  ConsumerState<TemuanScreen> createState() => _TemuanScreenState();
}

class _TemuanScreenState extends ConsumerState<TemuanScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temuan'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  counter += 1;
                });
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final state = ref.watch(taskProvider);
    return CustomScrollView(
      slivers: [
        Consumer(builder: (context, ref, child) {
          if (state != null) {
            return SliverList.builder(
              itemCount: counter,
              itemBuilder: (context, index) => TemuanItemCard(task: state),
            );
          } else {
            return Container();
          }
        }),
      ],
    );
  }
}
