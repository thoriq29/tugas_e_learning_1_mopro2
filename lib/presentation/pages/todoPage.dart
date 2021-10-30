import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moh_torikul_a_tugas_elearning_1/common/date_time_util.dart';
import 'package:moh_torikul_a_tugas_elearning_1/data/models/todo.dart';
import 'package:moh_torikul_a_tugas_elearning_1/presentation/provider/assignment_provider.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  Widget todo(BuildContext context,  TodoModel data) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Stack(
        children: [
          Card(
            color: Colors.white,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                left: 16,
                bottom: 8,
                right: 8,
                top: 8
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama: ${data.name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${DateTimeUtils.dateFormat(data.deadlineDate, format: 'EEEE, dd MMMM yyy')} Jam ${data.deadlineTime.hour}:${data.deadlineTime.minute}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    data.isFinished ? "Selesai" : "Belum Selesai",
                    maxLines: 2,
                    style: TextStyle(
                      color: data.isFinished ? Colors.green : Colors.red
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            
          ),
          Positioned(
            right: 10,
            top: 20,
            child: Checkbox(
              value: data.isFinished,
              onChanged: (val) => {
                Provider.of<AssignmentProvider>(context, listen: false).setFinishedTodo(data.id),
              }
            ),
          ),
        ],
      )
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AssignmentProvider>(
      builder: (context, provider, _) {
        return Container(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
          child: ListView(
            children: provider.taskList.map((element)  {
              return todo(context, element);
            }).toList(),
          ),
        );
      }
    );
  }
}

