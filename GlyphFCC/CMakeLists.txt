
cmake_minimum_required(VERSION 3.24)

project(GlyphFCC
    VERSION 0.1.0
    LANGUAGES CXX CUDA
)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_CUDA_STANDARD 20)
set(CMAKE_CUDA_STANDARD_REQUIRED ON)

add_executable(GlyphFCC
    cuda_test.cu
)

set_target_properties(GlyphFCC PROPERTIES
    CUDA_ARCHITECTURES 86
)
