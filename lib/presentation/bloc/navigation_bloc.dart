import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomMainNavbar extends StatefulWidget {
  @override
  State<BottomMainNavbar> createState() => _BottomMainNavbarState();
}

class _BottomMainNavbarState extends State<BottomMainNavbar> {
  User? user;

  @override
  void initState() {
    _getCurrentUser();
    super.initState();
  }

  void _getCurrentUser() {
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: BlocBuilder<NavigationBloc, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: IndexedStack(
              index: currentIndex,
              children: [
                HomePage(),
                CartPage(),
                OrderProgresPage(),
                user == null ? LoginPage() : ProfilePage(),
              ],
            ),
            bottomNavigationBar: BottomBar(
              selectedIndex: currentIndex,
              backgroundColor: Colors.white,
              onTap: (index) {
                context
                    .read<NavigationBloc>()
                    .add(NavigationEvent.values[index]);
              },
              items: <BottomBarItem>[
                BottomBarItem(
                  title: Text('Home'),
                  icon: SvgPicture.asset(
                    nav_home,
                    height: 20,
                    width: 20,
                  ),
                  activeColor: const Color.fromRGBO(58, 70, 129, 1),
                  activeIconColor: PrimaryColorBlue,
                  activeTitleColor: PrimaryColorBlue,
                ),
                BottomBarItem(
                  title: Text('Keranjang'),
                  icon: SvgPicture.asset(
                    nav_cart,
                    height: 20,
                    width: 20,
                  ),
                  activeColor: const Color.fromRGBO(58, 70, 129, 1),
                ),
                BottomBarItem(
                  title: Text('Pesanna'),
                  icon: SvgPicture.asset(
                    nav_order,
                    height: 20,
                    width: 20,
                  ),
                  activeColor: const Color.fromRGBO(58, 70, 129, 1),
                ),
                BottomBarItem(
                  title: Text('Profile'),
                  icon: SvgPicture.asset(
                    nav_profil,
                    width: 20,
                    height: 20,
                  ),
                  activeColor: const Color.fromRGBO(58, 70, 129, 1),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

enum NavigationEvent { home, cart, cartProgres, profile }

class NavigationBloc extends Bloc<NavigationEvent, int> {
  NavigationBloc() : super(0) {
    on<NavigationEvent>((event, emit) {
      switch (event) {
        case NavigationEvent.home:
          emit(0);
          break;
        case NavigationEvent.cart:
          emit(1);
          break;
        case NavigationEvent.cartProgres:
          emit(2);
          break;
        case NavigationEvent.profile:
          emit(3);
          break;
      }
    });
  }
}
