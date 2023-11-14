import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renmo_admin/utils/constants.dart';
import 'package:renmo_admin/views/accounts/account_detail.dart';
import 'package:renmo_admin/views/accounts/accounts.dart';
import 'package:renmo_admin/views/accounts/add_account.dart';
import 'package:renmo_admin/views/appearence/appearence.dart';
import 'package:renmo_admin/views/chat/chat.dart';
import 'package:renmo_admin/views/contact_support/contact_support.dart';
import 'package:renmo_admin/views/contact_support/faqs.dart';
import 'package:renmo_admin/views/customers/customer_detail.dart';
import 'package:renmo_admin/views/customers/customers.dart';
import 'package:renmo_admin/views/dashboard/dashboard_screen.dart';
import 'package:renmo_admin/views/home/home.dart';
import 'package:renmo_admin/views/orders/order_detail.dart';
import 'package:renmo_admin/views/orders/orders.dart';
import 'package:renmo_admin/views/products/add_instruction.dart';
import 'package:renmo_admin/views/products/add_product.dart';
import 'package:renmo_admin/views/products/delivery_categories.dart';
import 'package:renmo_admin/views/products/edit_categories.dart';
import 'package:renmo_admin/views/products/edit_category.dart';
import 'package:renmo_admin/views/products/products.dart';
import 'package:renmo_admin/views/statistics/chart.dart';
import 'package:renmo_admin/views/statistics/popular_products_statistics.dart';
import 'package:renmo_admin/views/statistics/statistics.dart';

import 'controllers/MenuAppController.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MenuAppController(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/dashboard',
    debugLogDiagnostics: true,
    observers: [GoRouterObserver()],
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return HomeScreen(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: Routes.dashboard,
            builder: (BuildContext context, GoRouterState state) {
              context.read<MenuAppController>().initialRoute = state.location;
              return const DashboardScreen();
            },
          ),
          GoRoute(
            path: Routes.products,
            builder: (BuildContext context, GoRouterState state) {
              context.read<MenuAppController>().initialRoute = state.location;
              return const Products();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'add',
                builder: (BuildContext context, GoRouterState state) {
                  return const AddProductScreen();
                },
              ),
              GoRoute(
                path: 'add_instruction',
                builder: (BuildContext context, GoRouterState state) {
                  return const AddInstructionScreen();
                },
              ),
              GoRoute(
                path: 'edit_categories',
                builder: (BuildContext context, GoRouterState state) {
                  return const EditCategories();
                },
              ),
              GoRoute(
                path: 'edit_category',
                builder: (BuildContext context, GoRouterState state) {
                  return const EditCategory();
                },
              ),
              GoRoute(
                path: 'delivery_categories',
                builder: (BuildContext context, GoRouterState state) {
                  return const DeliveryCategories();
                },
              ),
            ],
          ),
          GoRoute(
            path: Routes.orders,
            builder: (BuildContext context, GoRouterState state) {
              context.read<MenuAppController>().initialRoute = state.location;
              return const Orders();
            },
            routes: [
              GoRoute(
                path: 'order_details',
                builder: (BuildContext context, GoRouterState state) {
                  return const OrderDetail();
                },
              ),
            ]
          ),
          GoRoute(
              path: Routes.statistics,
              builder: (BuildContext context, GoRouterState state) {
                context.read<MenuAppController>().initialRoute = state.location;
                return const Statistics();
              },
              routes: [
                GoRoute(
                  path: 'chart',
                  builder: (BuildContext context, GoRouterState state) {
                    return const Chart();
                  },
                ),
                GoRoute(
                  path: 'popular_product',
                  builder: (BuildContext context, GoRouterState state) {
                    return const PopularProductStatistics();
                  },
                ),
              ]),
          GoRoute(
            path: Routes.contactsupport,
            builder: (BuildContext context, GoRouterState state) {
              context.read<MenuAppController>().initialRoute = state.location;
              return const ContactSupport();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'chat',
                builder: (BuildContext context, GoRouterState state) {
                  return const ChatScreen();
                },
              ),
              GoRoute(
                path: 'faq',
                builder: (BuildContext context, GoRouterState state) {
                  return const Faqs();
                },
              ),
            ],
          ),
          GoRoute(
            path: Routes.customers,
            builder: (BuildContext context, GoRouterState state) {
              context.read<MenuAppController>().initialRoute = state.location;
              return const Customers();
            },
            routes: [
              GoRoute(
                path: 'details',
                builder: (BuildContext context, GoRouterState state) {
                  return const CustomerDetail();
                },
              ),
            ]
          ),
          GoRoute(
              path: Routes.accounts,
              builder: (BuildContext context, GoRouterState state) {
                context.read<MenuAppController>().initialRoute = state.location;
                return const Accounts();
              },
              routes: [
                GoRoute(
                  path: 'add',
                  builder: (BuildContext context, GoRouterState state) {
                    return const AddAccount();
                  },
                ),
                GoRoute(
                  path: 'detail',
                  builder: (BuildContext context, GoRouterState state) {
                    return const AccountDetail();
                  },
                ),
              ]),
          GoRoute(
              path: Routes.appearance,
              builder: (BuildContext context, GoRouterState state) {
                context.read<MenuAppController>().initialRoute = state.location;
                return const Appearence();
              },
              ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Const.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Const.kPrimary),
        scaffoldBackgroundColor: Colors.white,
        drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('MyTest didPush: $route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('MyTest didPop: $route');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('MyTest didRemove: $route');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    print('MyTest didReplace: $newRoute');
  }
}
