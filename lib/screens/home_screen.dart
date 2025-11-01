import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/detail_screen.dart';
import 'package:habit_tracker/screens/quotes_screen.dart';
import 'package:habit_tracker/screens/settings_screen.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            color: Colors.blue.shade50,
            child: ListTile(
              leading: const Icon(Icons.format_quote, size: 40, color: Colors.blue),
              title: const Text('Motivational Quotes'),
              subtitle: const Text('Get inspired daily'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuotesScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'My Habits',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
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
