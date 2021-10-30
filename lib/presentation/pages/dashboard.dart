import 'package:flutter/material.dart';
import 'package:moh_torikul_a_tugas_elearning_1/presentation/provider/assignment_provider.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AssignmentProvider>(
        builder:(context, provider, _) {
          return Scaffold(
            body: Center(
              child: ListView(
                children: [
                  SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.checklist,
                            color: Colors.blue,
                            size: 80,
                          ),
                          Text('${provider.taskList.length} Total Task')
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                       height: 150,
                       width: MediaQuery.of(context).size.width * .5,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.timer,
                                color: Colors.red,
                                size: 80,
                              ),
                              Text('${provider.unFinishedTaskCount} Unfinished Task')
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                       height: 150,
                       width: MediaQuery.of(context).size.width * .5,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.checklist_rtl,
                                color: Colors.green,
                                size: 80,
                              ),
                              Text('${provider.finishedTaskCount} Total Finished Task')
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      )
    );
  }
}