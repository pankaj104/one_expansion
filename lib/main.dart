import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PageNavigator(),
  ));
}

class PageNavigator extends StatefulWidget {
  @override
  _PageNavigatorState createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  int currentIndex = 0;
  List<bool> isExpandedList = List.filled(7, false);

  void goToNextPage() {
    setState(() {
      if (currentIndex < sections.length - 1) {
        currentIndex++;
        isExpandedList = List.filled(sections.length, false);
      }
    });
  }

  List<Widget> sections = [
    PumpTypePageClass(),
    DishMachineSpecsPageClass(),
    DetergentSettingsAlertPageClass(),
    RinseSettingsAlertPageClass(),
    ThirdPumpSettingsPageClass(),
    HygieneSettingsWashPageClass(),
    HygieneSettingsRinsePageClass(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Navigator'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ExpansionPanelList(
            elevation: 1,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                for (int i = 0; i < sections.length; i++) {
                  if (i == index) {
                    isExpandedList[i] = !isExpandedList[i];
                  } else {
                    isExpandedList[i] = false;
                  }
                }
              });
            },
            children: List.generate(sections.length, (index) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text('Section ${index + 1}'),
                  );
                },
                body: ListTile(
                  title: sections[index],
                ),
                isExpanded: isExpandedList[index],
              );
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToNextPage,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

// Placeholder classes for demonstration
class PumpTypePageClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Pump Type Page'),
    );
  }
}

class DishMachineSpecsPageClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Dish Machine Specs Page'),
    );
  }
}

class DetergentSettingsAlertPageClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Detergent Settings Alert Page'),
    );
  }
}

class RinseSettingsAlertPageClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Rinse Settings Alert Page'),
    );
  }
}

class ThirdPumpSettingsPageClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Third Pump Settings Page'),
    );
  }
}

class HygieneSettingsWashPageClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Hygiene Settings Wash Page'),
    );
  }
}

class HygieneSettingsRinsePageClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Hygiene Settings Rinse Page'),
    );
  }
}

