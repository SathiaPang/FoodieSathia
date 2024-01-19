import 'package:FoodieSathia/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:FoodieSathia/data/data.dart';
import 'package:FoodieSathia/repositary/home_repository.dart';
import 'package:FoodieSathia/screen/widget/Home_Screen/Search/search_field.dart';
import 'package:FoodieSathia/screen/widget/Home_Screen/Search/seemore.dart';
import 'package:FoodieSathia/screen/widget/Home_Screen/item_view_home.dart';
import 'package:FoodieSathia/screen/widget/Home_Screen/appbar.dart';
import 'drawer_widget.dart';

import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final HomeController _controller = Get.put(HomeController());

  final foodCategorys = ["Fast Food", "Drink", "Snack"];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: foodCategorys.length, vsync: this);

    _tabController.addListener(() {
      _controller.setTabActive(_tabController.index);
      _controller.filterByTab(foodCategorys[_tabController.index]);
    });
  }

  List<Widget> _buildTabUI() {
    List<Widget> list = [];
    for (int i = 0; i < foodCategorys.length; i++) {
      list.add(buildTab(foodCategorys[i], _getIcon(foodCategorys[i]), i));
    }
    return list;
  }

  IconData _getIcon(String category) {
    switch (category) {
      case "Fast Food":
        return Icons.fastfood;
      case "Drink":
        return Icons.local_drink;
      case "Snack":
        return Icons.local_dining;
      default:
        return Icons.category;
    }
  }

  Widget buildTab(String label, IconData icon, int index) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _controller.activeTab.value == index
              ? Constants.primaryColor
              : Constants.UnselectedColor),
      height: size.height * 0.055,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(
              icon,
              color: _controller.activeTab.value == index
                  ? Constants.White
                  : Constants.formtextcolor,
            ),
            SizedBox(width: 20),
            Text(
              label,
              style: GoogleFonts.poppins(
                color: _controller.activeTab.value == index
                    ? Constants.White
                    : Constants.textcolors,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer_Widgets(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppBarWidget(
                scaffoldKey: _scaffoldKey,
              ),
              // SizedBox(height: 50),
              Text(
                'Find your',
                style: _commonTextStyle(),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Best Food',
                      style: _boldTextStyle(),
                    ),
                    TextSpan(
                      text: 'here',
                      style: _commonTextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              //For the Search bar with Catergory
              SearchField(),
              SizedBox(
                height: size.height * 0.02,
              ),
              Obx(
                () => TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.black,
                  tabAlignment: TabAlignment.start,
                  tabs: _buildTabUI(),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => SeeMoreScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'See all',
                      style: TextStyle(
                          color: Colors.red, fontSize: Get.height / 50),
                    )
                  ],
                ),
              ),
              Obx(
                () => Expanded(
                  child: ListView.builder(
                      itemCount: _controller.foodList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Item_View(food: _controller.foodList[index]);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _commonTextStyle() {
    return const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 35,
      color: Colors.black,
    );
  }

  TextStyle _boldTextStyle() {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: Colors.black,
    );
  }
}

class HomeController extends GetxController {
  final repo = HomeRepository();

  var selectedIndex = 0.obs;

  List<FoodRepo> allList = [];
  final foodList = <FoodRepo>[].obs;
  final activeTab = 0.obs;

  void setTabActive(int tab) {
    activeTab(tab);
  }

  @override
  void onReady() {
    allList = repo.getFoodList();
    filterByTab("Fast Food");
    super.onReady();
  }

  void filterByTab(String category) {
    final fiterList =
        allList.where((food) => food.category == category).toList();
    foodList(fiterList);
  }

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
