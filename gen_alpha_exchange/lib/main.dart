import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const GenAlphaExchangeApp());
}

class GenAlphaExchangeApp extends StatelessWidget {
  const GenAlphaExchangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gen Alpha AI Exchange',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF1a1a1a),
        scaffoldBackgroundColor: const Color(0xFF0f0f0f),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: const CryptoExchangeScreen(),
    );
  }
}

class CryptoExchangeScreen extends StatelessWidget {
  const CryptoExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a1a),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a1a1a),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Gen Alpha AI Exchange',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              'by Alpha.dev',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CryptoPriceCard(),
              const SizedBox(height: 20),
              const NewsCard(),
              const SizedBox(height: 20),
              const PartnershipCard(),
              const SizedBox(height: 20),
              const ActionButtons(),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Icon(Icons.keyboard_arrow_down, color: Colors.grey[600], size: 30),
                    Text('Next', style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CryptoPriceCard extends StatelessWidget {
  const CryptoPriceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0f0f0f),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'HOOD',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text('price', style: TextStyle(fontSize: 12)),
                  ),
                  const SizedBox(width: 10),
                  Text('sentiment', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 150,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey[800]!,
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 45,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '\$${value.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.grey[600], fontSize: 10),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        final times = ['0700', '1200', '1400', '1600', '1800', '2000'];
                        if (value >= 0 && value < times.length) {
                          return Text(
                            times[value.toInt()],
                            style: TextStyle(color: Colors.grey[600], fontSize: 10),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 5,
                minY: 162,
                maxY: 166,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 165.3),
                      const FlSpot(0.5, 165.5),
                      const FlSpot(1, 164.2),
                      const FlSpot(1.5, 164.8),
                      const FlSpot(2, 163.5),
                      const FlSpot(2.5, 163.9),
                      const FlSpot(3, 163.2),
                      const FlSpot(3.5, 163.6),
                      const FlSpot(4, 164.1),
                      const FlSpot(4.5, 164.3),
                      const FlSpot(5, 163.8),
                    ],
                    isCurved: true,
                    color: const Color(0xFF00D4AA),
                    barWidth: 2,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: const Color(0xFF00D4AA).withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('1H', style: TextStyle(fontSize: 12)),
                  const SizedBox(width: 15),
                  Text('1D', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  const SizedBox(width: 15),
                  Text('1M', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.show_chart, color: Colors.grey[600], size: 20),
                  const SizedBox(width: 10),
                  Icon(Icons.bar_chart, color: Colors.grey[600], size: 20),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0f0f0f),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Robinhood Cements Crypto Ambitions with \$200M Bitstamp Takeover',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Icon(Icons.upload_outlined, color: Colors.grey[600], size: 20),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Robinhood acquires Bitstamp, the world\'s oldest crypto exchange, to deepen global and...',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('3 minutes ago', style: TextStyle(color: Colors.grey[700], fontSize: 12)),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'read more',
                  style: TextStyle(color: Colors.yellow, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PartnershipCard extends StatelessWidget {
  const PartnershipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0f0f0f),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'HOOD/USD',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
          Text(
            'Why:Partnership Announcement',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
          const SizedBox(height: 15),
          Text(
            'Robinhood snatches up Bitstamp for a cool \$200M! 🔥 This ain\'t no meme stock, folks, it\'s a crypto power move! #CryptoKings',
            style: TextStyle(color: Colors.grey[400], fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ask AI clicked!')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[800],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.chat_bubble_outline, size: 20, color: Colors.grey[600]),
                const SizedBox(width: 8),
                const Text('Ask AI', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Trade with AI clicked!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDDFF00),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.chat_bubble, size: 20, color: Colors.grey[800]),
                    const SizedBox(width: 8),
                    const Text('Trade with AI', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Trade Against AI clicked!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDDFF00),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.chat_bubble_outline, size: 20, color: Colors.grey[800]),
                    const SizedBox(width: 8),
                    const Text('Trade Against AI', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}