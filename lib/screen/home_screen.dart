// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:monitor_app/constants/constants.dart';
import 'package:monitor_app/controller/app_provider.dart';
import 'package:monitor_app/model/account.dart';
import 'package:monitor_app/model/user_preferences.dart';
import 'package:monitor_app/screen/account_screen.dart';
import 'package:monitor_app/screen/components/task_card.dart';
import 'package:monitor_app/constants/strings.dart';
import 'package:monitor_app/mstate/task_state.dart';
import 'package:monitor_app/controller/task_controller.dart';
import 'package:monitor_app/screen/local_db_task_screen.dart';
import 'package:monitor_app/screen/task_screen.dart';
import 'package:location/location.dart' as loc;

class HomeScreen extends ConsumerStatefulWidget {
  static String routeName = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  late DateTimeRange dateRange;
  late UserPreferences pref;
  late StreamSubscription<InternetConnectionStatus> listener;

  @override
  void initState() {
    super.initState();
    dateRange = DateTimeRange(
      start: DateTime.now().subtract(const Duration(days: 30)),
      end: DateTime.now(),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      pref = await ref.read(preferenceManagerProvider).getUserData();

      ref.read(taskControllerProvider.notifier).getAllTasks(
            email: pref.username,
            dateTimeRange: dateRange,
            token: pref.token,
          );
    });
    checkInternetConnection(InternetConnectionChecker());

    enableLocation();
  }

  Future<void> enableLocation() async {
    bool locEnabled = await loc.Location().serviceEnabled();
    while (!locEnabled) {
      locEnabled = await loc.Location().requestService();
    }
  }

  Future<void> checkInternetConnection(
      InternetConnectionChecker internetConnectionChecker) async {
    listener = InternetConnectionChecker()
        .onStatusChange
        .listen((InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          debugPrint('connected');
          break;
        case InternetConnectionStatus.disconnected:
          debugPrint('disconnected');
          var snackBar = SnackBar(
            action: SnackBarAction(
                label: 'Muat ulang',
                onPressed: () async {
                  Future(
                    () => ref.read(taskControllerProvider.notifier).getAllTasks(
                          email: pref.username,
                          dateTimeRange: dateRange,
                          status: 'All',
                          token: pref.token,
                        ),
                  );
                }),
            content: const Text(
                'Koneksi internet Anda tidak stabil! Silahkan cek koneksi internet Anda'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          break;
        default:
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    listener.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final String status = ref.watch(statusTaskProvider);
    ref.listen<TaskState>(taskControllerProvider,
        (TaskState? prevState, TaskState newState) async {
      if (newState is PrepareTaskSuccess) {
        ref.read(selectedTaskId.notifier).state = newState.task.id;
        await Navigator.of(context)
            .pushNamed(TaskScreen.routeName, arguments: newState.task)
            .then((_) => Future(
                () => ref.read(taskControllerProvider.notifier).getAllTasks(
                      email: pref.username,
                      dateTimeRange: dateRange,
                      status: status,
                      token: pref.token,
                    )));
      }
    });
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: false,
        title: const Text(titleHomeScreen),
        actions: [
          IconButton(
            onPressed: () async {
              var localTasks =
                  await ref.read(localdataServiceProvider).getAllTasks();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LocalDbTaskScreen(
                    localTask: localTasks,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.task),
          ),
          IconButton(
            onPressed: () async => _buildModalBottomSheet(),
            icon: const Icon(Icons.filter_alt_rounded),
          ),
          IconButton(
            onPressed: () {
              Account account =
                  Account.fromMap(JwtDecoder.decode(pref.token)['employee']);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AccountScreen(account: account),
                ),
              );
            },
            icon: const Icon(Icons.account_circle_rounded),
          ),
        ],
      ),
      body: WillPopScope(
          onWillPop: () async => await showDialog(
                context: context,
                builder: (context) => _showDialogExit(),
              ),
          child: _getBody()),
    );
  }

  // @override
  // void didChangeDependencies() {
  //   debugPrint('didChangeDependencies');
  //   Future(() =>
  //       ref.read(taskControllerProvider.notifier).getAllTasks(widget.email));
  //   super.didChangeDependencies();
  // }

  Widget _getBody() {
    final state = ref.watch(taskControllerProvider);
    final String status = ref.watch(statusTaskProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // _buildSortAndFilter(),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              Future(
                () => ref.read(taskControllerProvider.notifier).getAllTasks(
                      email: pref.username,
                      dateTimeRange: dateRange,
                      status: status,
                      token: pref.token,
                    ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xFFEAEEF2),
              child: Consumer(
                builder: (context, ref, child) {
                  // debugPrint(state.toString());
                  if (state is TaskLoaded) {
                    if (state.tasks.isEmpty) {
                      return const Center(child: Text('No Task'));
                    } else {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return TaskCard(
                            task: state.tasks[index],
                            onSelectTask: () async {
                              if (state.tasks[index].status == STATUS_TODO) {
                                int selisih =
                                    selisihTanggal(state.tasks[index].dueDate!);
                                debugPrint('selisih : ${selisih}');
                                if (selisih < 0) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => const AlertDialog(
                                      title: Text('Peringatan'),
                                      content: Text(
                                          'Anda tidak bisa mengerjakan tugas ini karena jangka waktu pengerjaan tugas sudah habis!'),
                                    ),
                                  );
                                  return;
                                }
                                debugPrint(
                                    'not before ${state.tasks[index].notBefore}');
                                DateTime? notBefore =
                                    state.tasks[index].notBefore != null
                                        ? DateTime.parse(
                                            state.tasks[index].notBefore!)
                                        : null;

                                if (notBefore != null &&
                                    DateTime.now().isBefore(notBefore)) {
                                  debugPrint('Belum boleh dikerjakan');
                                  showDialog(
                                    context: context,
                                    builder: (context) => const AlertDialog(
                                      title: Text('Info'),
                                      content: Text(
                                          'Anda belum bisa mengerjakan tugas ini karena jangka waktu pengerjaan tugas selanjutnya minimal 20 hari dari pengerjaan tugas'),
                                    ),
                                  );
                                  return;
                                }

                                debugPrint(
                                    'Boleh dikerjakan ${state.tasks[index].id}');
                                ref
                                    .read(taskControllerProvider.notifier)
                                    .isTaskFoundInLocal(
                                        task: state.tasks[index]);
                                ref.read(isEditableChecklist.notifier).state =
                                    true;

                                // if (state.tasks[index].notBefore != null &&
                                //     DateTime.now().isBefore(DateTime.parse(
                                //         state.tasks[index].notBefore!))) {
                                //   debugPrint('Belum boleh dikerjakan');
                                // } else {
                                //   debugPrint('Boleh dikerjakan');
                                // }

                                // if (state.tasks[index].notBefore != null) {
                                //   DateTime notBefore = DateTime.parse(
                                //       state.tasks[index].notBefore!);
                                //   if (DateTime.now().isBefore(notBefore)) {
                                //     debugPrint('Belum boleh dikerjakan');
                                //   } else {
                                //     debugPrint('Boleh dikerjakan');
                                //     // ref
                                //     //     .read(taskControllerProvider.notifier)
                                //     //     .isTaskFoundInLocal(
                                //     //         task: state.tasks[index]);
                                //     // ref
                                //     //     .read(isEditableChecklist.notifier)
                                //     //     .state = true;
                                //   }
                                // } else {
                                //   debugPrint('Boleh dikerjakan');
                                //   // ref
                                //   //     .read(taskControllerProvider.notifier)
                                //   //     .isTaskFoundInLocal(
                                //   //         task: state.tasks[index]);
                                //   // ref.read(isEditableChecklist.notifier).state =
                                //   //     true;
                                // }
                              } else if (state.tasks[index].status ==
                                  STATUS_EXPIRED) {
                                showDialog(
                                  context: context,
                                  builder: (context) => const AlertDialog(
                                    title: Text('Peringatan'),
                                    content: Text(
                                        'Anda tidak bisa mengerjakan tugas ini karena jangka waktu pengerjaan tugas sudah habis!'),
                                  ),
                                );
                                return;
                              } else {
                                ref
                                    .read(taskControllerProvider.notifier)
                                    .sortTaskByRest(task: state.tasks[index]);
                                ref.read(isEditableChecklist.notifier).state =
                                    false;
                              }
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: state.tasks.length,
                      );
                    }
                  } else if (state is TaskLoadedWithError) {
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.message, textAlign: TextAlign.center),
                        TextButton(
                            onPressed: () async {
                              Future(
                                () => ref
                                    .read(taskControllerProvider.notifier)
                                    .getAllTasks(
                                      email: pref.username,
                                      dateTimeRange: dateRange,
                                      status: status,
                                      token: pref.token,
                                    ),
                              );
                            },
                            child: const Text('Muat Ulang'))
                      ],
                    ));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  int selisihTanggal(String tanggal) {
    if (tanggal.contains('T')) {
      tanggal = tanggal.substring(0, tanggal.indexOf('T'));
    }

    DateTime dateTime = DateTime.parse(tanggal);
    return dateTime.difference(DateTime.now()).inDays;
  }

  // Container _buildSortAndFilter() {
  //   return Container(
  //     color: Colors.white,
  //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         ElevatedButton.icon(
  //           style: ElevatedButton.styleFrom(
  //             padding: const EdgeInsets.symmetric(horizontal: 24),
  //             side: const BorderSide(color: Color.fromARGB(255, 37, 33, 33)),
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(20)),
  //             foregroundColor: Colors.white,
  //             elevation: 0,
  //             shadowColor: Colors.transparent,
  //           ),
  //           onPressed: () {
  //             _buildModalBottomSheet();
  //           },
  //           icon: const Icon(
  //             Icons.filter_alt_rounded,
  //             color: Colors.black,
  //           ),
  //           label: const Text(
  //             'Filter',
  //             style: TextStyle(color: Colors.black),
  //           ),
  //         ),
  //         // ElevatedButton.icon(
  //         //   style: ElevatedButton.styleFrom(
  //         //     padding: const EdgeInsets.symmetric(horizontal: 24),
  //         //     side: const BorderSide(color: Color.fromARGB(255, 37, 33, 33)),
  //         //     shape: RoundedRectangleBorder(
  //         //         borderRadius: BorderRadius.circular(20)),
  //         //     foregroundColor: Colors.white,
  //         //     elevation: 0,
  //         //     shadowColor: Colors.transparent,
  //         //   ),
  //         //   onPressed: () {},
  //         //   icon: const Icon(
  //         //     Icons.filter_alt_outlined,
  //         //     color: Colors.black,
  //         //   ),
  //         //   label: const Text(
  //         //     'fILTER',
  //         //     style: TextStyle(color: Colors.black),
  //         //   ),
  //         // ),
  //       ],
  //     ),
  //   );
  // }

  Future<dynamic> _buildModalBottomSheet() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, StateSetter setState) {
          return Container(
            padding: const EdgeInsets.all(20),
            height: 300,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Range Date :'),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 187, 201, 230)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    showDateRangePicker(
                            context: context,
                            firstDate: DateTime(2022),
                            lastDate: DateTime(2040),
                            initialDateRange: dateRange,
                            initialEntryMode: DatePickerEntryMode.calendarOnly)
                        .then((value) {
                      setState(() {
                        if (value != null) dateRange = value;
                        debugPrint(
                            'periode : ${DateFormat('dd/MM/yyyy').format(dateRange.start)}  -  ${DateFormat('dd/MM/yyyy').format(dateRange.end)}');
                      });
                    });
                  },
                  icon: const Icon(
                    Icons.calendar_month_rounded,
                    color: Colors.black,
                  ),
                  label: Text(
                    '${DateFormat('dd/MM/yyyy').format(dateRange.start)}  -  ${DateFormat('dd/MM/yyyy').format(dateRange.end)} ',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Status Task :'),
                _buildDropdownStatus(),
                const Spacer(),
                Consumer(builder: (context, ref, child) {
                  final String status = ref.watch(statusTaskProvider);
                  return InkWell(
                    onTap: () {
                      ref.read(taskControllerProvider.notifier).getAllTasks(
                            email: pref.username,
                            dateTimeRange: dateRange,
                            status: status,
                            token: pref.token,
                          );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text('Apply',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDropdownStatus() {
    return Consumer(builder: (_, WidgetRef ref, __) {
      var status = ref.watch(statusTaskProvider);
      debugPrint('status : $status');
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 1, color: const Color.fromARGB(255, 187, 201, 230))),
        child: DropdownButton(
          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(10),
          value: status.isNotEmpty ? status : null,
          onChanged: (value) {
            debugPrint('value : $value');
            // ref.read(taskControllerProvider.notifier).getAllTasks(
            //     email: widget.email, dateTimeRange: dateRange, status: value);
            ref.read(statusTaskProvider.notifier).state = value!;
          },
          items: listStatus.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      );
    });
  }

  _showDialogExit() {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Ya')),
        TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Tidak'))
      ],
      title: const Text('Keluar Aplikasi'),
      content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
    );
  }
}
