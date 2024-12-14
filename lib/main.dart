// Copyright (c) 2024, Gerald
// https://basekit.com

// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_base_kit/app/utils/starter_handler.dart';
import 'package:flutter_base_kit/app/view/app_entry/app.dart';

void main() async {
  await init();
  runApp(const App());
}
