import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  void handleDownload(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Report downloaded successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FFF8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Analysis Report",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4CAF50),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () => handleDownload(context),
                      icon: const Icon(Icons.download, color: Colors.white, size: 18),
                      label: const Text(
                        "Download",
                        style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),

              buildReportCard(),

              buildSectionCard(
                "Sample Information",
                Column(
                  children: [
                    buildInfoRow("Herb Name:", "Neem (Azadirachta indica)"),
                    buildInfoRow("Sample ID:", "NEE-2025-001"),
                    buildInfoRow("Origin:", "Rajasthan, India"),
                    buildInfoRow("Batch:", "NK-240115"),
                  ],
                ),
              ),

              buildSectionCard(
                "Taste Fingerprint Analysis",
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    ResultItem(label: "Bitter", value: "65%"),
                    ResultItem(label: "Astringent", value: "25%"),
                    ResultItem(label: "Pungent", value: "10%"),
                  ],
                ),
              ),

              buildSectionCard(
                "Phytochemical Fingerprint",
                Column(
                  children: [
                    buildCompoundRow("Azadirachtin", "88%"),
                    buildCompoundRow("Nimbin", "75%"),
                    buildCompoundRow("Nimbidin", "82%"),
                    buildCompoundRow("Gedunin", "68%"),
                    buildCompoundRow("Salannin", "72%"),
                  ],
                ),
              ),

              buildSectionCard(
                "Quality Assessment",
                Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF4CAF50),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: const Text(
                            "PURE",
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Overall Score: 94/100",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF2E7D32)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    buildInfoRow("Purity Level:", "98.2%"),
                    buildInfoRow("Adulterant Detection:", "None Found"),
                    buildInfoRow("Heavy Metals:", "Within Limits"),
                    buildInfoRow("Moisture Content:", "7.2%"),
                  ],
                ),
              ),

              buildSectionCard(
                "Recommendations",
                const Text(
                  "This neem sample shows excellent purity and high azadirachtin content. "
                      "Store in a cool, dry place away from direct sunlight to maintain bioactivity. "
                      "Use within 18 months for optimal potency. Maintain moisture content below 8% "
                      "for better stability and preservation.",
                  style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  children: [
                    Text(
                      "Certified by Purity in a Pulse",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2E7D32)),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "This report is generated using advanced analytical techniques "
                          "and meets international quality standards.",
                      style: TextStyle(fontSize: 12, color: Colors.black54, height: 1.3),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildReportCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.description, color: Color(0xFF4CAF50), size: 32),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Herbal Analysis Report", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32))),
                  SizedBox(height: 4),
                  Text("Report ID: HAR-2024-001", style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Row(children: [Icon(Icons.calendar_today, size: 16, color: Colors.black54), SizedBox(width: 8), Text("September 8, 2025")]),
              SizedBox(height: 8),
              Row(children: [Icon(Icons.location_on, size: 16, color: Colors.black54), SizedBox(width: 8), Text("Quality Lab, Mumbai")]),
              SizedBox(height: 8),
              Row(children: [Icon(Icons.person, size: 16, color: Colors.black54), SizedBox(width: 8), Text("Dr. Sarah Johnson")]),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSectionCard(String title, Widget child) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF2E7D32))),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.black54)),
          Text(value, style: const TextStyle(fontSize: 14, color: Color(0xFF2E7D32), fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget buildCompoundRow(String name, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF2E7D32))),
          Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF4CAF50))),
        ],
      ),
    );
  }
}

class ResultItem extends StatelessWidget {
  final String label;
  final String value;
  const ResultItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4CAF50))),
      ],
    );
  }
}