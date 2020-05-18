library package_loading_assets;

import 'package:flutter/services.dart' show rootBundle;

class PackageLoadingAssets {
  static Future<String> printTextFile() async {
    String text = await rootBundle.loadString('packages/package_loading_assets/assets/my_text.txt', );

    print("package_loading_assets: text: $text");
    return text;
  }
}

