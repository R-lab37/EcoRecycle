import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoRecycle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the HomeScreen after a delay
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'EcoRecycle',
              style: TextStyle(
                color: Color.fromARGB(255, 52, 2, 187),
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Building a Sustainable Future',
              style: TextStyle(
                  color: Color.fromARGB(255, 38, 0, 144),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Row(
          children: [
            Icon(Icons.eco, size: 30, color: Colors.white), // Example icon
            SizedBox(width: 8.0),
            Text(
              'EcoRecycle',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WasteSegregationCard(),
            PointsRewardsCard(),
            ChallengesLeaderboardCard(),
            EducationalContent(),
            NewsEventsCard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Feedback & Reporting screen
          // Add your navigation logic here
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FeedbackScreen()),
          );
        },
        tooltip: 'Provide Feedback',
        child: Icon(Icons.feedback),
      ),
    );
  }
}

class EducationalContent extends StatelessWidget {
  const EducationalContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(16.0),
      child: ListTile(
        leading: Icon(Icons.book),
        title: Text('Environmental Impact of Plastic'),
        subtitle: Text('Plastic pollution poses a significant threat'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to the Waste Segregation Guide screen
          // Add your navigation logic here
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EducationalContentScreen()),
          );
        },
      ),
    );
  }
}

class EducationalContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education & Knowledge'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Educational Content',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Explore articles, infographics, and videos providing information on the environmental impact of plastic, the benefits of recycling, and sustainable living tips.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              // Add your educational content widgets here
              ArticleCard(
                title: 'The Impact of Plastic Pollution',
                content:
                    ' This pollution chokes marine wildlife, damages soil and poisons groundwater, and can cause serious health impacts.',
              ),
              ArticleCard(
                title: 'Benefits of Recycling',
                content:
                    'save money by reducing the amount of waste that is sent to landfills. Recycling can also save energy and raw materials, which can help lower production costs for businesses.',
              ),
              VideoCard(
                title: 'Sustainable Living Tips',
                videoUrl: 'https://youtu.be/ibCa4jueINw?si=aCpoJ5TU8wFZK6iw',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String title;
  final String content;

  ArticleCard({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final String title;
  final String videoUrl;

  VideoCard({required this.title, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200, // Adjust the height as needed
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: Center(
              child: Icon(
                Icons.play_circle_filled,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WasteSegregationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(16.0),
      child: ListTile(
        leading: Icon(Icons.sort),
        title: Text('Waste Segregation Guide'),
        subtitle: Text('Properly segregate waste at source'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to the Waste Segregation Guide screen
          // Add your navigation logic here
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WasteSegregationGuideScreen()),
          );
        },
      ),
    );
  }
}

class WasteSegregationGuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Waste Segregation Guide'),
      ),
      body: SingleChildScrollView(
        child: WasteSegregationGuideContent(),
      ),
    );
  }
}

class WasteSegregationGuideContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This is the list of Recyclable and Non-Recycalable Items ',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            // Recyclables
            WasteCategoryCard(
              title: 'Recyclables',
              items: [
                'Paper',
                'Plastic bottles and containers',
                'Glass',
                'Metal cans',
                'Cardboard',
              ],
              icon: Icons.recycling_rounded,
              color: Colors.blue,
            ),
            // Non-Recyclables
            WasteCategoryCard(
              title: 'Non-Recyclables',
              items: [
                'Food waste',
                'Soiled paper',
                'Hazardous materials',
                'Batteries',
              ],
              icon: Icons.delete,
              color: Colors.red,
            ),
            // Compostables
            WasteCategoryCard(
              title: 'Compostables',
              items: [
                'Food scraps',
                'Yard waste',
                'Coffee grounds',
              ],
              icon: Icons.eco,
              color: Colors.green,
            ),
            SizedBox(height: 20),

            // Quiz & Tips
            QuizAndTips(),
          ],
        ),
      ),
    );
  }
}

class WasteCategoryCard extends StatelessWidget {
  final String title;
  final List<String> items;
  final IconData icon;
  final Color color;

  WasteCategoryCard({
    required this.title,
    required this.items,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  icon,
                  color: color,
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map((item) => Text(
                        '• $item',
                        style: TextStyle(fontSize: 14),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizAndTips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quiz & Tips',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Take a fun quiz to test your knowledge and get helpful tips for effective waste segregation.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add your quiz navigation logic here
              },
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

class PointsRewardsCard extends StatelessWidget {
  const PointsRewardsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(16.0),
      child: ListTile(
        leading: Icon(Icons.star),
        title: Text('Points & Rewards'),
        subtitle: Text('Earn points and redeem rewards'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to the Points & Rewards screen
          // Add your navigation logic here
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PointsAndRewardsScreen()),
          );
        },
      ),
    );
  }
}

class PointsAndRewardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Points and Rewards'),
      ),
      body: SingleChildScrollView(
        child: PointsAndRewardsContent(),
      ),
    );
  }
}

class PointsAndRewardsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Points and Rewards',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Track recycling contributions and earn points redeemable for discounts and rewards from local eco-friendly businesses.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          // Add your points and rewards widgets here
          PointsAndRewardsCard(
            points: 100,
            description: 'Redeemable for a 10% discount at GreenMart.',
          ),
          PointsAndRewardsCard(
            points: 200,
            description: 'Redeemable for a free reusable water bottle.',
          ),
        ],
      ),
    );
  }
}

class PointsAndRewardsCard extends StatelessWidget {
  final int points;
  final String description;

  PointsAndRewardsCard({required this.points, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Points: $points',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class ChallengesLeaderboardCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(16.0),
      child: ListTile(
        leading: Icon(Icons.group),
        title: Text('Community Challenges'),
        subtitle: Text('Engage in friendly competitions'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to the Challenges & Leaderboards screen
          // Add your navigation logic here
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CommunityChallengeScreen()),
          );
        },
      ),
    );
  }
}

class CommunityChallengeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Challenges'),
      ),
      body: SingleChildScrollView(
        child: CommunityChallengeContent(),
      ),
    );
  }
}

class CommunityChallengeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Community Challenges',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Foster competition and engagement through friendly challenges among neighborhoods or individuals, showcasing recycling achievements.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          // Add your community challenge widgets here
          CommunityChallengeCard(
            title: 'Plastic-Free Week',
            description:
                'Challenge: Avoid using single-use plastic for a week.',
          ),
          CommunityChallengeCard(
            title: 'Recycling Olympics',
            description:
                'Challenge: Collect and recycle the most items in a month.',
          ),
        ],
      ),
    );
  }
}

class CommunityChallengeCard extends StatelessWidget {
  final String title;
  final String description;

  CommunityChallengeCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsEventsCard extends StatelessWidget {
  const NewsEventsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(16.0),
      child: ListTile(
        leading: Icon(Icons.event),
        title: Text('News & Events'),
        subtitle: Text('Stay updated on local initiatives'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to the News & Events screen
          // Add your navigation logic here
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsAndEventsScreen()),
          );
        },
      ),
    );
  }
}

class NewsAndEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News and Events'),
      ),
      body: NewsAndEventsContent(),
    );
  }
}

class NewsAndEventsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        NewsEventCard(
          title: 'Community Cleanup Day',
          date: 'December 10, 2023',
          description:
              'Join us for a community cleanup day to make our neighborhood cleaner and greener.',
        ),
        NewsEventCard(
          title: 'Environmental Awareness Workshop',
          date: 'December 15, 2023',
          description:
              'Learn about sustainable living practices and how to reduce your carbon footprint.',
        ),
        NewsEventCard(
          title: 'New Recycling Program Launch',
          date: 'December 20, 2023',
          description:
              'We are excited to announce the launch of a new recycling program in collaboration with local businesses.',
        ),
        // Add more NewsEventCard widgets as needed
      ],
    );
  }
}

class NewsEventCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;

  NewsEventCard({
    required this.title,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Date: $date',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8.0),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback & Reporting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Provide Feedback',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            const TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter your feedback here...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement logic to submit feedback
                // You can send the feedback to a server or store it locally
                // Add your feedback submission logic here
                // For now, we'll just show a simple dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Feedback Submitted'),
                    content: Text('Thank you for your feedback!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
