import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String habitName;
  final String habitDescription;
  final IconData habitIcon;

  const DetailScreen({
    super.key,
    required this.habitName,
    required this.habitDescription,
    required this.habitIcon,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;
  int currentStreak = 0;
  List<bool> completionHistory = List.filled(7, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.habitName),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                widget.habitIcon,
                size: 100,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              widget.habitDescription,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            Text(
              'Current Streak',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              '$currentStreak days',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),
            Text(
              'Last 7 Days',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(7, (index) {
                return Column(
                  children: [
                    Text(
                      ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index],
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          completionHistory[index] = !completionHistory[index];
                          currentStreak = _calculateStreak();
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: completionHistory[index]
                              ? Colors.green
                              : Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: completionHistory[index]
                            ? const Icon(Icons.check, color: Colors.white)
                            : null,
                      ),
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    int today = DateTime.now().weekday - 1;
                    completionHistory[today] = true;
                    currentStreak = _calculateStreak();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Habit marked as complete for today!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Mark Complete Today'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _calculateStreak() {
    int streak = 0;
    for (int i = completionHistory.length - 1; i >= 0; i--) {
      if (completionHistory[i]) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }
}
