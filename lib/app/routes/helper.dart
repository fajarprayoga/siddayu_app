import 'dart:async';

import 'package:flutter/material.dart ' as my_material;
import 'package:go_router/go_router.dart';

class Route {
  static GoRoute set(
      String path, my_material.Widget Function(GoRouterState state) builder,
      {FutureOr<String?> Function(GoRouterState)? redirect}) {
    return GoRoute(
      path: path,
      builder: (my_material.BuildContext context, GoRouterState state) =>
          builder(state),
      redirect: (_, GoRouterState state) => redirect?.call(state),
    );
  }
}
