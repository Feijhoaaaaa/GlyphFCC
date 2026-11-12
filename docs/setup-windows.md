\# Windows Development Environment Setup



\## Development Environment



| Component | Version |

|---|---|

| Visual Studio | 2026 Community |

| MSVC | 19.51.36260 |

| CUDA Toolkit | 13.5 |

| GPU | NVIDIA GeForce RTX 3050 Ti Laptop GPU |

| CUDA Architecture | sm\_86 |

| C++ Standard | C++20 |



\## CUDA Compiler Configuration



CUDA compilation must use the MSVC x64 development environment.



Initialize the Visual Studio developer shell:



```powershell

\& "C:\\Program Files\\Microsoft Visual Studio\\18\\Community\\Common7\\Tools\\Launch-VsDevShell.ps1" -Arch amd64 -HostArch amd64 -SkipAutomaticLocation

```



Verify the compiler:



```powershell

where.exe cl

nvcc --version

```



The MSVC compiler path should contain `Hostx64\\x64`.



\## Troubleshooting



\### cudafe++ ACCESS\_VIOLATION



Observed error:



```text

nvcc error : 'cudafe++' died with status 0xC0000005 (ACCESS\_VIOLATION)

```



The initial environment selected the x86 MSVC compiler instead of x64.



Switching to the x64 developer environment resolved the compilation failure.



For an RTX 3050 Ti, the standalone CUDA test can be compiled with:



```powershell

nvcc -m64 -arch=sm\_86 cuda\_test.cu -o cuda\_test.exe

```



\## Build Verification



The CMake CUDA test compiled successfully and produced the expected results.



