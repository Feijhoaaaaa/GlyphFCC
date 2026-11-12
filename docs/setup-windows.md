# Windows Development Environment Setup

## 1. Overview

This document describes the development environment required to build and run **GlyphFCC**, a GPU-accelerated image processing and visualization application written in C++20 and NVIDIA CUDA.

**Platform:** Windows 11 x64

**Development status:** Core toolchain installed and CUDA execution verified.

## 2. Development Environment

| Component | Installed Version |
|---|---|
| Operating System | Windows 11 x64 |
| Visual Studio | Community 2026 |
| MSVC Compiler | 19.51.36260 |
| C++ Standard | C++20 |
| CUDA Toolkit | 13.5.37 |
| CUDA Architecture | sm_86 |
| NVIDIA Driver | 621.01 |
| CMake | 4.3.1-msvc1 |
| Git | 2.56.0.windows.4 |
| vcpkg | 2026-10-29 |

### GPU Hardware

| Property | Value |
|---|---|
| Primary GPU | NVIDIA GeForce RTX 3050 Ti Laptop GPU |
| GPU Architecture | Ampere |
| Compute Capability | 8.6 |
| Video Memory | 4 GB |
| Secondary GPU | AMD Radeon(TM) Graphics |

The NVIDIA GPU is used for CUDA computations.

## 3. Installation Paths

The development tools are installed in the following locations:

```text
Visual Studio:
C:\Program Files\Microsoft Visual Studio\18\Community

CUDA Toolkit:
C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v13.5

vcpkg:
C:\dev\vcpkg

Project:
C:\Code\GlyphFCC
```

## 4. Visual Studio Configuration

### Required Components

Install the following Visual Studio components:

- Desktop development with C++
- MSVC x64/x86 build tools
- Windows 11 SDK
- C++ CMake tools for Windows

### Initialize MSVC x64 Environment

Open PowerShell and execute:

```powershell
& "C:\Program Files\Microsoft Visual Studio\18\Community\Common7\Tools\Launch-VsDevShell.ps1" -Arch amd64 -HostArch amd64 -SkipAutomaticLocation
```

Verify the compiler:

```powershell
where.exe cl
cl /Bv
```

Expected compiler architecture:

```text
Hostx64\x64\cl.exe
```

The project must be compiled using the x64 MSVC toolchain.

## 5. NVIDIA CUDA Configuration

### Verify GPU Driver

```powershell
nvidia-smi
```

Verified hardware and driver:

```text
GPU: NVIDIA GeForce RTX 3050 Ti Laptop GPU
Driver: 621.01
CUDA UMD Version: 13.5
```

### Verify CUDA Compiler

```powershell
nvcc --version
```

Installed CUDA Toolkit:

```text
CUDA compilation tools, release 13.5, V13.5.37
```

### Verify CUDA Environment

```powershell
$env:CUDA_PATH
```

Expected:

```text
C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v13.5
```

## 6. CMake Configuration

CMake is provided by Visual Studio.

Installed version:

```text
cmake version 4.3.1-msvc1
```

Verify:

```powershell
cmake --version
```

CMake is available in the Visual Studio developer environment.

If the command is not recognized in regular PowerShell, initialize the Visual Studio developer shell.

### Build GlyphFCC

From the repository root:

```powershell
cd C:\Code\GlyphFCC

cmake -S . -B build -G "Visual Studio 18 2026" -A x64

cmake --build build --config Debug
```

### Run CUDA Test

```powershell
.\build\GlyphFCC\Debug\GlyphFCC.exe
```

Expected output:

```text
0 11 22 33 44
CUDA GPU test passed
```

## 7. Git Configuration

Installed version:

```text
git version 2.56.0.windows.4
```

Verify:

```powershell
git --version
```

Verify user configuration:

```powershell
git config --global user.name
git config --global user.email
```

Repository:

https://github.com/Feijhoaaaaa/GlyphFCC

Default branch:

```text
main
```

## 8. vcpkg Configuration

vcpkg is used to manage C++ dependencies.

### Installed Version

```text
2026-10-29
```

Full version identifier:

```text
2026-10-29-139f2e53438b1529e178f6295bc563f4e0de734f
```

### Installation Directory

```text
C:\dev\vcpkg
```

### Verify Installation

```powershell
C:\dev\vcpkg\vcpkg.exe version
```

### Configure Environment Variable

```powershell
[Environment]::SetEnvironmentVariable(
    "VCPKG_ROOT",
    "C:\dev\vcpkg",
    "User"
)
```

For the current PowerShell session:

```powershell
$env:VCPKG_ROOT = "C:\dev\vcpkg"
```

Verify:

```powershell
$env:VCPKG_ROOT
```

### Future CMake Integration

The vcpkg CMake toolchain is located at:

```text
C:\dev\vcpkg\scripts\buildsystems\vcpkg.cmake
```

When project dependencies are introduced, vcpkg will be integrated using a `vcpkg.json` manifest and `CMAKE_TOOLCHAIN_FILE`.

Project-specific libraries are not required during the initial environment setup.

## 9. Troubleshooting

### 9.1 CUDA ACCESS_VIOLATION

Observed error:

```text
nvcc error : 'cudafe++' died with status 0xC0000005 (ACCESS_VIOLATION)
```

**Cause identified during setup:**

The development environment selected the x86 MSVC compiler:

```text
HostX86\x86\cl.exe
```

Instead of the x64 compiler:

```text
Hostx64\x64\cl.exe
```

**Solution:**

Initialize the Visual Studio x64 developer environment:

```powershell
& "C:\Program Files\Microsoft Visual Studio\18\Community\Common7\Tools\Launch-VsDevShell.ps1" -Arch amd64 -HostArch amd64 -SkipAutomaticLocation
```

Compile CUDA with:

```powershell
nvcc -m64 -arch=sm_86 cuda_test.cu -o cuda_test.exe
```

The CUDA compilation error was resolved after switching to the x64 toolchain.

### 9.2 CMake Not Recognized

Observed error:

```text
cmake : The term 'cmake' is not recognized
```

**Cause:**

The CMake executable provided by Visual Studio was not available in the standard PowerShell environment.

**Solution:**

Use Developer PowerShell for Visual Studio or initialize the corresponding development environment.

### 9.3 Invalid CMake Cache After Directory Rename

After renaming the project from `GliphFCC` to `GlyphFCC`, existing build directories may contain outdated absolute paths.

**Solution:**

Configure a clean build directory:

```powershell
cmake -S . -B build-new -G "Visual Studio 18 2026" -A x64

cmake --build build-new --config Debug
```

Old generated build directories can be removed when they are no longer needed.

## 10. Verification Checklist

- [x] Visual Studio installed
- [x] MSVC x64 compiler configured
- [x] C++20 available
- [x] NVIDIA CUDA Toolkit installed
- [x] NVIDIA GPU detected
- [x] CUDA compilation successful
- [x] CUDA kernel execution successful
- [x] CMake configured
- [x] CMake + CUDA build successful
- [x] Git installed and connected to GitHub
- [x] vcpkg installed and executable
- [x] Development tool versions documented

## 11. Next Steps

With the development toolchain configured, the project can proceed to:

1. Project architecture and directory structure
2. CMake module organization
3. C++ and CUDA source separation
4. Image loading implementation
5. GPU-accelerated image processing
6. Character rendering and animation

The environment setup establishes the foundation for further GlyphFCC development.
