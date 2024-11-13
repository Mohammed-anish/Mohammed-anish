// ignore_for_file: constant_identifier_names

class Key {
  static const int A = 65;
  static const int B = 66;
  static const int C = 67;
  static const int D = 68;
  static const int E = 69;
  static const int F = 70;
  static const int G = 71;
  static const int H = 72;
  static const int I = 73;
  static const int J = 74;
  static const int K = 75;
  static const int L = 76;
  static const int M = 77;
  static const int N = 78;
  static const int O = 79;
  static const int P = 80;
  static const int Q = 81;
  static const int R = 82;
  static const int S = 83;
  static const int T = 84;
  static const int U = 85;
  static const int V = 86;
  static const int W = 87;
  static const int X = 88;
  static const int Y = 89;
  static const int Z = 90;

  static const int specialKeyMask = 199; // No modifiers

  static const int LeftShift = 1; // Bitmask for Left Shift
  static const int RightShift = 1; // Bitmask for Right Shift
  static const int LeftControl = 2; // Bitmask for Left Control
  static const int RightControl = 2; // Bitmask for Right Control
  static const int LeftAlt = 6; // Bitmask for Left Alt
  static const int RightAlt = 7;

  static const int lshiftKeyCode = 340;
  static const int rshiftKeyCode = 344;

  static get specialKeys {
    return [
      lshiftKeyCode,
      rshiftKeyCode,
      LeftControl,
      RightControl,
      LeftAlt,
      RightAlt
    ];
  }
}
