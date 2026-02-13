import 'package:flutter/material.dart';
import 'package:travel_flutter/presentation/common_widgets/text_field.dart';
import 'package:travel_flutter/utils/extensions.dart';

class TopSection extends StatefulWidget {
  const TopSection({super.key});

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: InkWell(
            onTap: () => context.themeController.setTheme(
              context.isDarkTheme ? "light" : "dark",
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFDFEAF6),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person,
                color: context.themeOption.colorPrimary,
                size: 26,
              ),
            ),
          ),
          title: Text(
            'Good Morning',
            style: TextStyle(
              fontSize: 14,
              color: context.themeOption.colorBlack2,
            ),
          ),
          subtitle: Text(
            'Max Holloway',
            style: TextStyle(
              fontSize: 16,
              color: context.themeOption.colorBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              color: context.themeOption.colorWhite2,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: context.themeOption.colorBlack,
              ),
            ),
          ),
        ),
        textFieldInput(
          prefixIcon: Icon(Icons.search),
          hintText: "Where to next?",
        ),
      ],
    );
  }
}
