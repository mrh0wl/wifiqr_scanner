import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class FloatingBottomNavbar extends StatefulWidget {
  final Color unselectedColor;
  final Color barColor;
  final List<IconData> icons;
  const FloatingBottomNavbar({
    required this.icons,
    required this.unselectedColor,
    required this.barColor,
    Key? key,
  }) : super(key: key);

  @override
  State<FloatingBottomNavbar> createState() => _FloatingBottomNavbarState();
}

class _FloatingBottomNavbarState extends State<FloatingBottomNavbar>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late TabController _tabController;
  late TabsRouter _tabsRouter;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _tabsRouter = AutoTabsRouter.of(context);
    _currentPage = _tabsRouter.activeIndex;
    _tabController = TabController(
      initialIndex: _currentPage,
      length: widget.icons.length,
      vsync: this,
    );
    _tabController.animation!.addListener(
      () {
        final value = _tabController.index;
        _tabsRouter.setActiveIndex(value);
      },
    );

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ))
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(500),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(500),
          ),
          child: Material(
            color: widget.barColor,
            child: TabBar(
              indicatorColor: const Color(0xFF22C2EA),
              indicatorPadding: const EdgeInsets.all(3),
              splashFactory: NoSplash.splashFactory,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xFF22C2EA),
              ),
              controller: _tabController,
              tabs: List.generate(
                widget.icons.length,
                (index) => InkWell(
                  child: Icon(
                    widget.icons[index],
                    size: _tabsRouter.activeIndex == index ? 28 : null,
                    color: _tabsRouter.activeIndex == index
                        ? widget.barColor
                        : widget.unselectedColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
