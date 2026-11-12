
cmake_minimum_required(VERSION 3.24)

project(GliphFCC
    VERSION 0.1.0
    LANGUAGES CXX CUDA
)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_CUDA_STANDARD 20)
set(CMAKE_CUDA_STANDARD_REQUIRED ON)

add_executable(GliphFCC
    cuda_test.cu
)

set_target_properties(GliphFCC PROPERTIES
    CUDA_ARCHITECTURES 86
)
