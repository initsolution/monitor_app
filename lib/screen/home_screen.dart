// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:monitor_app/components/task_card.dart';
import 'package:monitor_app/constants/strings.dart';
import 'package:monitor_app/mstate/task_state.dart';
import 'package:monitor_app/provider/task_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String routeName = 'home';
  final String email;
  const HomeScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      debugPrint('HomeScreen initState : email ${widget.email}');
      ref.read(taskNotifierProvider.notifier).getAllTasks(widget.email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: false,
        title: const Text(titleHomeScreen),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    final state = ref.watch(taskNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // _buildSortAndFilter(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            color: const Color(0xFFEAEEF2),
            child: Consumer(
              builder: (context, ref, child) {
                if (state is TaskLoaded) {
                  if (state.tasks.isEmpty) {
                    return const Center(child: Text('No Task'));
                  } else {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return TaskCard(task: state.tasks[index]);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: state.tasks.length,
                    );
                  }
                } else if (state is TaskLoadedWithError) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Container _buildSortAndFilter() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              side: const BorderSide(color: Color.fromARGB(255, 37, 33, 33)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              foregroundColor: Colors.white,
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_upward,
              color: Colors.black,
            ),
            label: const Text(
              'Terbaru',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              side: const BorderSide(color: Color.fromARGB(255, 37, 33, 33)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              foregroundColor: Colors.white,
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.filter_alt_outlined,
              color: Colors.black,
            ),
            label: const Text(
              'fILTER',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
