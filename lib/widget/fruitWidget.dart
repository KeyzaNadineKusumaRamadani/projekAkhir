import 'package:flutter/material.dart';

class Fruitwidget {
  showFullModal(BuildContext context, Widget isi) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Close",
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, anim1, anim2) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: AppBar(
                elevation: 6,
                centerTitle: true,
                backgroundColor: Colors.green.shade700,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.green.shade800,
                        Colors.green.shade600,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                title: const Text(
                  "Data Buah",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            body: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green.shade50,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12,
                        spreadRadius: 2,
                        offset: const Offset(2, 5),
                        color: Colors.green.shade200.withOpacity(0.4),
                      ),
                    ],
                  ),
                  child: isi,
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        final curvedValue =
            Curves.easeOut.transform(anim1.value) - 1.0;

        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * -50, 0.0),
          child: Opacity(
            opacity: anim1.value,
            child: child,
          ),
        );
      },
    );
  }
}
