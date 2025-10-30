import 'package:flutter/material.dart';
import 'package:master_plan/provider/plan_provider.dart';
import '../models/data_layer.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;

  // Gunakan 'widget.plan' hanya sebagai identifier (name)
  // Data Plan yang sebenarnya diambil dari Notifier

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        // Menghilangkan fokus (keyboard) saat scroll
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  Widget build(BuildContext context) {
    // Ambil notifier
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(widget.plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          // **Perbaikan Kunci:** Ambil Plan terbaru berdasarkan nama
          Plan currentPlan;
          try {
            currentPlan = plans.firstWhere((p) => p.name == widget.plan.name);
          } catch (e) {
            // Jika Plan tidak ditemukan (misalnya, baru dihapus di layar lain), 
            // biarkan pengguna kembali ke layar sebelumnya.
            return const Center(child: Text('Plan not found or deleted.'));
          }

          return Column(
            children: [
              // Kirim currentPlan terbaru dan plansNotifier ke _buildList
              Expanded(child: _buildList(currentPlan, plansNotifier)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      // Kirim plansNotifier ke FAB
      floatingActionButton: _buildAddTaskButton(plansNotifier),
    );
  }

  Widget _buildAddTaskButton(ValueNotifier<List<Plan>> planNotifier) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        // Ambil Plan terbaru sebelum diubah
        Plan currentPlan = planNotifier.value.firstWhere(
          (p) => p.name == widget.plan.name,
        );
        int planIndex = planNotifier.value.indexWhere(
          (p) => p.name == currentPlan.name,
        );
        
        // Buat daftar tasks baru dan tambahkan Task kosong
        List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
          ..add(const Task());
          
        // Perbarui Notifier dengan Plan baru (immutable update)
        planNotifier.value = List<Plan>.from(planNotifier.value)
          ..[planIndex] = Plan(name: currentPlan.name, tasks: updatedTasks);
      },
    );
  }

  // Menerima Plan terbaru dan Notifier
  Widget _buildList(Plan plan, ValueNotifier<List<Plan>> planNotifier) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          // Kirim task, index, Plan terbaru, dan Notifier ke tile
          _buildTaskTile(plan.tasks[index], index, plan, planNotifier),
    );
  }

  // Menerima Task, index, Plan terbaru (currentPlan), dan Notifier
  Widget _buildTaskTile(
    Task task,
    int index,
    Plan currentPlan, // Plan terbaru dari builder
    ValueNotifier<List<Plan>> planNotifier,
  ) {
    
    // Fungsi untuk memperbarui Plan
    void updatePlan({bool? complete, String? description}) {
        int planIndex = planNotifier.value.indexWhere(
            (p) => p.name == currentPlan.name,
        );

        // **Pencegahan Range Error Tambahan:** Cek Plan Index
        if (planIndex == -1) {
            return; // Plan tidak ditemukan, batalkan pembaruan.
        }
        
        // Dapatkan Plan terbaru di Notifier untuk menghindari race condition
        Plan latestPlan = planNotifier.value[planIndex];

        // **Pencegahan Range Error Tambahan:** Cek Task Index
        if (index >= latestPlan.tasks.length) {
            return; // Index task tidak valid, batalkan pembaruan.
        }

        // Buat Task baru dengan data yang diperbarui
        Task updatedTask = Task(
            description: description ?? task.description,
            complete: complete ?? task.complete,
        );

        // Buat daftar Tasks baru
        List<Task> updatedTasks = List<Task>.from(latestPlan.tasks)
          ..[index] = updatedTask;

        // Perbarui Notifier
        planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
                name: latestPlan.name,
                tasks: updatedTasks,
            );
    }


    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          updatePlan(complete: selected ?? false);
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          updatePlan(description: text);
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}