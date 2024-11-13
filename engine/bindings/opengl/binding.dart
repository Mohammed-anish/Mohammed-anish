// ignore_for_file: constant_identifier_names

part of '../opengl.dart';

final DynamicLibrary _opengl = Platform.isWindows
    ? DynamicLibrary.open(
        '${Directory.current.path}\\core\\opengl32.dll') // On Windows, use glfw3.dll.
    : DynamicLibrary.open('libglfw.so'); // On Linux, use libglfw.so.

///Buffers
const int colorBufferBit = 0x00004000; // Clears the color buffer
const int depthBufferBit = 0x00000100; // Clears the depth buffer
const int stencilBufferBit = 0x00000400; // Clears the stencil buffer

///Available attributes to be enabled by glEnable
const int GL_BLEND = 0x0BE2;
const int GL_CLIP_DISTANCE0 = 0x3000; // GL_CLIP_DISTANCEi for i = 0
const int GL_CLIP_DISTANCE1 = 0x3001; // GL_CLIP_DISTANCEi for i = 1
const int GL_CLIP_DISTANCE2 = 0x3002; // GL_CLIP_DISTANCEi for i = 2
const int GL_CLIP_DISTANCE3 = 0x3003; // GL_CLIP_DISTANCEi for i = 3
const int GL_CLIP_DISTANCE4 = 0x3004; // GL_CLIP_DISTANCEi for i = 4
const int GL_CLIP_DISTANCE5 = 0x3005; // GL_CLIP_DISTANCEi for i = 5
const int GL_COLOR_LOGIC_OP = 0x0BF2;
const int GL_CULL_FACE = 0x0B44;
const int GL_DEPTH_CLAMP = 0x864F;
const int GL_DEPTH_TEST = 0x0B71;
const int GL_DITHER = 0x0BD0;
const int GL_FRAMEBUFFER_SRGB = 0x8DB9;
const int GL_LINE_SMOOTH = 0x0B20;
const int GL_MULTISAMPLE = 0x809D;
const int GL_POLYGON_OFFSET_FILL = 0x8037;
const int GL_POLYGON_OFFSET_LINE = 0x2A02;
const int GL_POLYGON_OFFSET_POINT = 0x2A01;
const int GL_POLYGON_SMOOTH = 0x0B41;
const int GL_PRIMITIVE_RESTART = 0x8C2B;
const int GL_SAMPLE_ALPHA_TO_COVERAGE = 0x809E;
const int GL_SAMPLE_ALPHA_TO_ONE = 0x809F;
const int GL_SAMPLE_COVERAGE = 0x80A0;
const int GL_SCISSOR_TEST = 0x0C11;
const int GL_STENCIL_TEST = 0x0B90;
const int GL_TEXTURE_CUBE_MAP_SEAMLESS = 0x884F;
const int GL_PROGRAM_POINT_SIZE = 0x8642;

class OpenGLBinding {
  final GlClearDart glClear =
      _opengl.lookup<NativeFunction<GlClearC>>('glClear').asFunction();

  final GlClearColorDart glClearColor = _opengl
      .lookup<NativeFunction<GlClearColorC>>('glClearColor')
      .asFunction();

// Bind the glBegin function
  final GlBeginDart glBegin =
      _opengl.lookup<NativeFunction<GlBeginC>>('glBegin').asFunction();

  final GlEndDart glEnd =
      _opengl.lookup<NativeFunction<GlEndC>>('glEnd').asFunction();

  final GlVertex3fDart glVertex3f =
      _opengl.lookup<NativeFunction<GlVertex3fC>>('glVertex3f').asFunction();
  final GlRotatefDart glRotatef =
      _opengl.lookup<NativeFunction<GlRotatefC>>('glRotatef').asFunction();

  final GlEnableDart glEnable =
      _opengl.lookup<NativeFunction<GlEnableNative>>('glEnable').asFunction();

  final GlColor3FDart glColor3F =
      _opengl.lookup<NativeFunction<GlColor3FNative>>('glColor3f').asFunction();

  final GlColor3fvDart glColor3fv = _opengl
      .lookup<NativeFunction<GlColor3fvC>>('glColor3fv')
      .asFunction<GlColor3fvDart>();


}
