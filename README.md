
# GlyphFCC

GPU-accelerated image processing and character-based
visual effects built with C++ and NVIDIA CUDA.

## Overview

GlyphFCC is an experimental GPU computing project
that transforms images into animated glyph-based
visualizations.

## Planned Features

- Image loading and preprocessing
- Grayscale conversion
- Contrast enhancement
- GPU-accelerated brightness analysis
- Character-based animation
- Unicode and color support
- Video export

## Technology Stack

- C++20
- NVIDIA CUDA
- CMake
- MSVC
- Visual Studio 2026

## Requirements

- Windows 11 x64
- Visual Studio with C++ development tools
- CMake
- NVIDIA CUDA Toolkit
- Compatible NVIDIA GPU

## Build

Run from the repository root in an x64
Visual Studio developer environment:

```powershell
cmake -S . -B build -G "Visual Studio 18 2026" -A x64
cmake --build build --config Debug
```

Run the CUDA test:

```powershell
.\build\GlyphFCC\Debug\GlyphFCC.exe
```

## Current Status

Development environment configured.

- C++20 compiler working
- CUDA compilation working
- GPU execution verified
- CMake integration configured

## Documentation

See [Windows Setup](docs/setup-windows.md).

## License

MIT License. See [LICENSE](LICENSE).
