import 'package:flutter/material.dart';
import 'package:moh_torikul_a_tugas_elearning_1/common/date_time_util.dart';
import 'package:moh_torikul_a_tugas_elearning_1/presentation/provider/assignment_provider.dart';
import 'package:provider/provider.dart';

import 'app_widgets.dart';

class TodoWidget {
  static showAddTodoForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Consumer<AssignmentProvider>(
            builder: (context, provider, _) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                    child: const Text("Tambah Tugas Baru"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[200]!,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      child: ListTile(
                        leading: const Icon(
                          Icons.edit,
                        ),
                        title: Consumer<AssignmentProvider>(
                          builder: (_, assignmentProvider, __) {
                            return TextFormField(
                              controller:
                                assignmentProvider.textEditingController,
                              decoration: InputDecoration(
                                hintText: 'Judul Tugas',
                                hintStyle: const TextStyle(color: Colors.black),
                                labelStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
                                fillColor: Colors.white,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ListTile(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      AppWidget.showDateTimePicker(context);
                    },
                    leading: const Icon(
                      Icons.event,
                    ),
                    title: Text(
                      DateTimeUtils.dateFormat(provider.deadlineDate, format: 'EEEE, dd MMMM yyy')
                    ),
                  ),
                  ListTile(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      AppWidget.showTimePicker(context);
                    },
                    leading: const Icon(
                      Icons.timer,
                    ),
                    title: Text(
                      DateTimeUtils.dateFormat(provider.deadlineTime, format: 'HH:mm')
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<AssignmentProvider>(context, listen: false).insertToTaskList(
                          provider.textEditingController.text,
                          provider.deadlineDate as DateTime, 
                          provider.deadlineTime as TimeOfDay, 
                        );
                      },
                      child: const Text('Simpan'),
                      style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    ),
                  )
                ],
              );
            }
          ),
        );
      }
    );
  }
}