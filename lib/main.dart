import 'package:flutter/material.dart';

void main() {
  runApp(const SaintAlphaApp());
}

class SaintAlphaApp extends StatelessWidget {
  const SaintAlphaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saint Alpha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const SaintAlphaHome(),
    );
  }
}

class SaintAlphaHome extends StatefulWidget {
  const SaintAlphaHome({super.key});

  @override
  State<SaintAlphaHome> createState() => _SaintAlphaHomeState();
}

class _SaintAlphaHomeState extends State<SaintAlphaHome> {
  int selectedIndex = 0;

  final pages = const [
    DashboardPage(),
    ResearchPage(),
    FieldsPage(),
    AlphaVaultPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.science_outlined),
            selectedIcon: Icon(Icons.science),
            label: 'Research',
          ),
          NavigationDestination(
            icon: Icon(Icons.library_books_outlined),
            selectedIcon: Icon(Icons.library_books),
            label: 'Fields',
          ),
          NavigationDestination(
            icon: Icon(Icons.emoji_events_outlined),
            selectedIcon: Icon(Icons.emoji_events),
            label: 'Vault',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class PageFrame extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const PageFrame({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          Text(subtitle),
          const SizedBox(height: 25),
          child,
        ],
      ),
    );
  }
}

// DASHBOARD

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageFrame(
      title: 'Saint Alpha',
      subtitle: 'Research. Simulate. Evolve.',
      child: Column(
        children: [
          DashboardCard(
            icon: Icons.science,
            title: 'Active Research',
            value: 'Delayed News Reaction',
            description: 'Research project',
          ),
          DashboardCard(
            icon: Icons.star,
            title: 'Best Alpha',
            value: 'Sharpe 2.79',
            description: 'Fitness 2.63',
          ),
          DashboardCard(
            icon: Icons.library_books,
            title: 'Field Library',
            value: 'Ready',
            description: 'Multiple regions supported',
          ),
          DashboardCard(
            icon: Icons.security,
            title: 'Correlation Guard',
            value: 'ACTIVE',
            description: 'Approved Alpha Vault protected',
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String description;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, size: 30),
        title: Text(title),
        subtitle: Text('$value\n$description'),
        isThreeLine: true,
      ),
    );
  }
}

// RESEARCH

class ResearchPage extends StatefulWidget {
  const ResearchPage({super.key});

  @override
  State<ResearchPage> createState() => _ResearchPageState();
}

class _ResearchPageState extends State<ResearchPage> {
  final TextEditingController hypothesisController =
      TextEditingController();

  String status = 'Waiting for research...';

  void generateAlpha() {
    setState(() {
      status = 'Alpha candidate generation is ready for AI integration.';
    });
  }

  void simulate() {
    setState(() {
      status = 'Simulator is ready for the simulation engine.';
    });
  }

  void reduceCorrelation() {
    setState(() {
      status =
          'Correlation engine is ready to search for lower-correlation variants.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      title: 'Research Lab',
      subtitle: 'Create, simulate and improve alpha ideas.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: hypothesisController,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Economic hypothesis',
              hintText:
                  'Example: Negative company-specific news may cause delayed price adjustment over 5–10 days.',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          FilledButton.icon(
            onPressed: generateAlpha,
            icon: const Icon(Icons.auto_awesome),
            label: const Text('Generate Alpha'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: simulate,
            icon: const Icon(Icons.play_arrow),
            label: const Text('Simulate'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: reduceCorrelation,
            icon: const Icon(Icons.build),
            label: const Text('Reduce Correlation'),
          ),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(status),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Research Pipeline',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const PipelineStep(
            text: 'Economic hypothesis',
            completed: true,
          ),
          const PipelineStep(
            text: 'Field selection',
            completed: true,
          ),
          const PipelineStep(
            text: 'Alpha generation',
            completed: false,
          ),
          const PipelineStep(
            text: 'Simulation',
            completed: false,
          ),
          const PipelineStep(
            text: 'Correlation screening',
            completed: false,
          ),
          const PipelineStep(
            text: 'Improve / Approve',
            completed: false,
          ),
        ],
      ),
    );
  }
}

class PipelineStep extends StatelessWidget {
  final String text;
  final bool completed;

  const PipelineStep({
    super.key,
    required this.text,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        completed ? Icons.check_circle : Icons.radio_button_unchecked,
      ),
      title: Text(text),
    );
  }
}

// FIELD LIBRARY

class FieldsPage extends StatefulWidget {
  const FieldsPage({super.key});

  @override
  State<FieldsPage> createState() => _FieldsPageState();
}

class _FieldsPageState extends State<FieldsPage> {
  final List<String> fields = [
    'equity_sentiment_score',
    'news_impact_projection_score',
    'composite_sentiment_score_2',
    'fscore_momentum',
    'fscore_total',
    'fnd6_newa1v1300_eps',
    'fnd6_newa1v1300_capx',
    'fnd6_mkvalt',
    'anl4_cfo_value',
    'anl4_bvps_value',
    'anl4_capex_low',
    'anl4_afv4_median_eps',
    'returns',
    'adv20',
    'low',
    'market',
    'opencap',
  ];

  void addField() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Field'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Enter field name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  setState(() {
                    fields.add(controller.text.trim());
                  });
                }

                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      title: 'Field Library',
      subtitle: 'Add, update and organize your research fields.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FilledButton.icon(
            onPressed: addField,
            icon: const Icon(Icons.add),
            label: const Text('Add Field'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Field upload will be connected to persistent storage.',
                  ),
                ),
              );
            },
            icon: const Icon(Icons.upload_file),
            label: const Text('Upload Field File'),
          ),
          const SizedBox(height: 20),
          for (final field in fields)
            Card(
              child: ListTile(
                leading: const Icon(Icons.data_object),
                title: Text(field),
                subtitle: const Text('USA • Available'),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Editing $field'),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// APPROVED ALPHA VAULT

class AlphaVaultPage extends StatelessWidget {
  const AlphaVaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageFrame(
      title: 'Approved Alpha Vault',
      subtitle:
          'Approved alphas are stored and used to protect future research from excessive correlation.',
      child: Column(
        children: [
          AlphaCard(
            id: '#001',
            name: 'Fundamental Acceleration',
            sharpe: '2.79',
            fitness: '2.63',
            correlation: 'Reference',
          ),
          AlphaCard(
            id: '#002',
            name: 'Analyst Revision',
            sharpe: '2.51',
            fitness: '1.92',
            correlation: 'Max 0.41',
          ),
          AlphaCard(
            id: '#003',
            name: 'News Reaction',
            sharpe: '2.35',
            fitness: '1.87',
            correlation: 'Max 0.54',
          ),
        ],
      ),
    );
  }
}

class AlphaCard extends StatelessWidget {
  final String id;
  final String name;
  final String sharpe;
  final String fitness;
  final String correlation;

  const AlphaCard({
    super.key,
    required this.id,
    required this.name,
    required this.sharpe,
    required this.fitness,
    required this.correlation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.emoji_events),
        title: Text('$id • $name'),
        subtitle: Text(
          'Sharpe $sharpe • Fitness $fitness\nCorrelation: $correlation',
        ),
        isThreeLine: true,
      ),
    );
  }
}

// SETTINGS

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageFrame(
      title: 'Research Settings',
      subtitle: 'Configure the active research profile.',
      child: Column(
        children: [
          SettingItem(name: 'Region', value: 'USA'),
          SettingItem(name: 'Universe', value: 'TOP3000'),
          SettingItem(name: 'Delay', value: '1'),
          SettingItem(name: 'Decay', value: '6'),
          SettingItem(name: 'Neutralization', value: 'Industry'),
          SettingItem(name: 'Truncation', value: '0.08'),
          SettingItem(name: 'Maximum Correlation', value: '0.70'),
          SettingItem(name: 'Target Sharpe', value: '4.50'),
          SettingItem(name: 'Target Fitness', value: '2.00'),
        ],
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final String name;
  final String value;

  const SettingItem({
    super.key,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        trailing: Text(value),
      ),
    );
  }
}
