import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.track_changes, size: 28),
            const SizedBox(width: 8),
            const Text('Habit Tracker'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.fitness_center, size: 40),
              title: const Text('Exercise'),
              subtitle: const Text('30 minutes daily'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailScreen(
                        habitName: 'Exercise',
                        habitDescription: '30 minutes daily',
                        habitIcon: Icons.fitness_center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.book, size: 40),
              title: const Text('Reading'),
              subtitle: const Text('20 pages daily'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailScreen(
                        habitName: 'Reading',
                        habitDescription: '20 pages daily',
                        habitIcon: Icons.book,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.water_drop, size: 40),
              title: const Text('Drink Water'),
              subtitle: const Text('8 glasses daily'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailScreen(
                        habitName: 'Drink Water',
                        habitDescription: '8 glasses daily',
                        habitIcon: Icons.water_drop,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add new habit
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
