// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'fr';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "testMessage" : MessageLookupByLibrary.simpleMessage("Ceci est un message de test i18n. Si vous pouvez le lire dans différentes langues après avoir appuyé sur l\'un des boutons ci-dessous, tout doit être configuré correctement."),
    "testMessageThree" : MessageLookupByLibrary.simpleMessage("Le troisième! Hey google translate, quoi de neuf?"),
    "testMessageTwo" : MessageLookupByLibrary.simpleMessage("Hé, voici la deuxième chaîne de test ...: -) Voyons si cela fonctionne")
  };
}
