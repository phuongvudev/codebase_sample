import "dart:math";

/// You just increase the length if necessary to improve performance
/// Attention to the security(id is key)
///
/// Characters	Length	Total   States
/// UUID	      16	    32	    16^32 = 3.4e+38
/// Base58	    58	    22	    58^22 = 6.2e+38
/// ---------------------------------------------------------
/// Length	    Example	                          Total States
/// nanoid(8)	re6ZkUUV	                        1.3e+14
/// nanoid(12)	pfpPYdZGbZvw	                    1.4e+21
/// nanoid(16)	sFDUZScHfZTfkLwk	                1.6e+28
/// nanoid(24)	u7vzXJL9cGqUeabGPAZ5XUJ6	        2.1e+42
/// nanoid(32)	qkvPDeH6JyAsRhaZ3X4ZLDPSLFP7MnJz	2.7e+56
///
///  See @https://unkey.dev/blog/uuid-ux
///

/// Helper class for generating custom IDs.
class IDHelpers {
  /// The string containing the custom alphabet used for generating IDs.
  static const customAlphabetString =
      "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";

  /// The default length for prefix IDs.
  static const defaultPrefixIdLength = 22;

  /// The length for entity IDs.
  static const entityIdLength = 25;

  /// Random number generator.
  static final _random = Random.secure();

  /// Generates a random ID using a custom alphabet.
  static String _customAlphabet(String alphabet, int size) {
    final len = alphabet.length;
    String id = '';
    while (0 < size--) {
      id += alphabet[_random.nextInt(len)];
    }
    return id;
  }

  /// Generates a random ID with the specified [size].
  static String _generateId(int size) {
    return _customAlphabet(customAlphabetString, size);
  }

  /// Generates a prefix ID with the specified [prefix] and [length].
  static String generatePrefixId({
    String prefix = "tu",
    int length = defaultPrefixIdLength,
  }) {
    return '${prefix}_${_generateId(length)}';
  }

  /// Generates a user ID with the specified [length].
  static String generateUserId({int length = defaultPrefixIdLength}) {
    return generatePrefixId(prefix: "u", length: length);
  }
}
