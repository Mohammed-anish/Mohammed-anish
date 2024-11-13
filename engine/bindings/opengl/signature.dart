part of '../opengl.dart';

// Typedef for glClear
typedef GlClearC = Void Function(Uint64 mask);
typedef GlClearDart = void Function(int mask);

// Typedef for glClearColor
typedef GlClearColorC = Void Function(
    Float red, Float green, Float blue, Float alpha);
typedef GlClearColorDart = void Function(
    double red, double green, double blue, double alpha);

typedef GlBeginC = Void Function(Uint32 mode);
typedef GlBeginDart = void Function(int mode);

typedef GlEndC = Void Function();
typedef GlEndDart = void Function();

typedef GlVertex3fC = Void Function(Float x, Float y, Float z);
typedef GlVertex3fDart = void Function(double x, double y, double z);

typedef GlRotatefC = Void Function(Float angle, Float x, Float y, Float z);
typedef GlRotatefDart = void Function(
    double angle, double x, double y, double z);

typedef GlEnableNative = Void Function(Uint32 cap);
typedef GlEnableDart = void Function(int cap);

typedef GlColor3FNative = Void Function(Float r, Float g, Float b);
typedef GlColor3FDart = void Function(double r, double g, double b);


typedef GlColor3fvC = Void Function(Pointer<Float> color);
typedef GlColor3fvDart = void Function(Pointer<Float> color);

