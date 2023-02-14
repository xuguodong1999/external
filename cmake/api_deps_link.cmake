# yoga
function(xgd_link_yoga TARGET)
    add_dependencies(${TARGET} yoga)
    target_link_libraries(${TARGET} PRIVATE yoga)
endfunction()

# spdlog
function(xgd_link_spdlog TARGET)
    add_dependencies(${TARGET} spdlog)
    target_link_libraries(${TARGET} PRIVATE spdlog)
    xgd_add_global_init_unit(${TARGET} spdlog)
endfunction()

# Threads::Threads
function(xgd_link_threads TARGET)
    cmake_parse_arguments(param "PUBLIC" "" "" ${ARGN})
    if (param_PUBLIC)
        target_link_libraries(${TARGET} PUBLIC Threads::Threads)
    else ()
        target_link_libraries(${TARGET} PRIVATE Threads::Threads)
    endif ()
endfunction()

# gtest
function(xgd_link_gtest TARGET)
    cmake_parse_arguments(param "NO_MAIN" "" "" ${ARGN})
    add_dependencies(${TARGET} gtest)
    target_link_libraries(${TARGET} PRIVATE gtest)
    if (NOT param_NO_MAIN)
        target_sources(
                ${TARGET}
                PRIVATE ${XGD_DEPS_DIR}/cpp/gtest-src/gtest/googletest/src/gtest_main.cc
        )
    endif ()
    set(TEST_COMMAND "${TARGET}")
    if (EMSCRIPTEN AND NODEJS_RUNTIME)
        set(TEST_COMMAND
                "${NODEJS_RUNTIME}"
                "--experimental-wasm-threads"
                "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${TARGET}.js")
    elseif (XGD_WINE64_RUNTIME)
        set(TEST_COMMAND
                "${XGD_WINE64_RUNTIME}"
                "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${TARGET}.exe")
    endif ()
    add_test(NAME ${TARGET} COMMAND ${TEST_COMMAND} WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
    if (NOT TARGET gtest_programs_all)
        add_custom_target(gtest_programs_all)
    endif ()
    add_dependencies(gtest_programs_all ${TARGET})
endfunction()

# benchmark
function(xgd_link_benchmark TARGET)
    cmake_parse_arguments(param "NO_MAIN" "" "" ${ARGN})
    add_dependencies(${TARGET} benchmark)
    target_link_libraries(${TARGET} PRIVATE benchmark)
    if (NOT param_NO_MAIN)
        target_sources(
                ${TARGET}
                PRIVATE ${XGD_DEPS_DIR}/cpp/benchmark-src/benchmark/src/benchmark_main.cc
        )
    endif ()
    if (NOT TARGET benchmark_programs_all)
        add_custom_target(benchmark_programs_all)
    endif ()
    add_dependencies(benchmark_programs_all ${TARGET})
endfunction()

# zlib
function(xgd_link_zlib TARGET)
    cmake_parse_arguments(param "PUBLIC" "" "" ${ARGN})
    add_dependencies(${TARGET} zlib)
    if (param_PUBLIC)
        target_link_libraries(${TARGET} PUBLIC zlib)
    else ()
        target_link_libraries(${TARGET} PRIVATE zlib)
    endif ()
endfunction()

# libxml2
function(xgd_link_xml2 TARGET)
    add_dependencies(${TARGET} xml2)
    target_link_libraries(${TARGET} PRIVATE xml2)
endfunction()

# libpng
function(xgd_link_png TARGET)
    cmake_parse_arguments(param "PUBLIC" "" "" ${ARGN})
    if (param_PUBLIC)
        target_link_libraries(${TARGET} PUBLIC png)
    else ()
        target_link_libraries(${TARGET} PRIVATE png)
    endif ()
    if (WIN32 AND BUILD_SHARED_LIBS)
        target_compile_definitions(${TARGET} PRIVATE PNG_USE_DLL)
    endif ()
endfunction()

# boost
function(xgd_link_boost TARGET)
    # usage: xgd_link_boost(your-awesome-target PRIVATE [iostreams json ...])
    cmake_parse_arguments(param "" "" "PRIVATE;PUBLIC" ${ARGN})
    if ((NOT param_PRIVATE) AND (NOT param_PUBLIC))
        message(FATAL "xgd_link_boost: no components given")
    endif ()
    foreach (COMPONENT ${param_PRIVATE})
        if (NOT TARGET Boost::${COMPONENT})
            message(STATUS "boost: use Boost::${COMPONENT} as an interface")
            xgd_use_header(${TARGET} PRIVATE boost)
            continue()
        endif ()
        add_dependencies(${TARGET} Boost::${COMPONENT})
        target_link_libraries(${TARGET} PRIVATE Boost::${COMPONENT})
    endforeach ()
    foreach (COMPONENT ${param_PUBLIC})
        if (NOT TARGET Boost::${COMPONENT})
            message(STATUS "boost: use Boost::${COMPONENT} as an interface")
            xgd_use_header(${TARGET} PUBLIC boost)
            continue()
        endif ()
        add_dependencies(${TARGET} Boost::${COMPONENT})
        target_link_libraries(${TARGET} PUBLIC Boost::${COMPONENT})
    endforeach ()
endfunction()

# opencv
function(xgd_link_opencv TARGET)
    cmake_parse_arguments(param "" "" "PRIVATE;PUBLIC" ${ARGN})
    foreach (COMPONENT ${param_PRIVATE})
        add_dependencies(${TARGET} opencv_${COMPONENT})
        target_link_libraries(${TARGET} PRIVATE opencv_${COMPONENT})
    endforeach ()
    foreach (COMPONENT ${param_PUBLIC})
        add_dependencies(${TARGET} opencv_${COMPONENT})
        target_link_libraries(${TARGET} PUBLIC opencv_${COMPONENT})
    endforeach ()
endfunction()


# qt
function(xgd_link_qt TARGET)
    # usage: xgd_link_qt(your-awesome-target COMPONENTS [Core Widgets ...])
    cmake_parse_arguments(param "" "" "PRIVATE" ${ARGN})
    if (NOT param_PRIVATE)
        message(FATAL "xgd_link_qt: no components given")
    endif ()
    foreach (COMPONENT ${param_PRIVATE})
        add_dependencies(${TARGET} Qt${QT_VERSION_MAJOR}::${COMPONENT})
        target_link_libraries(${TARGET} PRIVATE Qt${QT_VERSION_MAJOR}::${COMPONENT})
    endforeach ()
    target_compile_definitions(
            ${TARGET}
            PRIVATE
            QT_DISABLE_DEPRECATED_BEFORE=0x060000
    )
    xgd_add_global_init_unit(${TARGET} qt)
    set_target_properties(${TARGET} PROPERTIES AUTOUIC ON AUTOMOC ON AUTORCC ON)
endfunction()

# vulkan
function(xgd_link_vulkan TARGET)
    if (TARGET Vulkan::Vulkan)
        target_link_libraries(${TARGET} PRIVATE Vulkan::Vulkan)
    else ()
        target_include_directories(${TARGET} PRIVATE ${Vulkan_INCLUDE_DIR})
        target_link_libraries(${TARGET} PRIVATE ${Vulkan_LIBRARIES})
    endif ()
    if (TARGET Vulkan::shaderc_combined)
        target_link_libraries(${TARGET} PRIVATE Vulkan::shaderc_combined)
    else ()
        target_include_directories(${TARGET} PRIVATE ${Vulkan_INCLUDE_DIR})
        target_link_libraries(${TARGET} PRIVATE ${Vulkan_shaderc_combined_LIBRARY})
    endif ()
    if (ANDROID)
        target_include_directories(${TARGET} PRIVATE ${Vulkan_ANDROID_INCLUDE_DIR})
    endif ()
endfunction()

# inchi
function(xgd_link_inchi TARGET)
    add_dependencies(${TARGET} inchi)
    target_link_libraries(${TARGET} PRIVATE inchi)
endfunction()

# maeparser
function(xgd_link_maeparser TARGET)
    add_dependencies(${TARGET} maeparser)
    target_link_libraries(${TARGET} PRIVATE maeparser)
endfunction()

# coordgenlibs
function(xgd_link_coordgenlibs TARGET)
    add_dependencies(${TARGET} coordgenlibs)
    target_link_libraries(${TARGET} PRIVATE coordgenlibs)
endfunction()

# openbabel
function(xgd_link_openbabel TARGET)
    add_dependencies(${TARGET} openbabel)
    target_link_libraries(${TARGET} PRIVATE openbabel)
    xgd_add_global_init_unit(${TARGET} openbabel)
endfunction()

# ade
function(xgd_link_ade TARGET)
    add_dependencies(${TARGET} ade)
    target_link_libraries(${TARGET} PRIVATE ade)
endfunction()

# yaehmop
function(xgd_link_yaehmop TARGET)
    add_dependencies(${TARGET} yaehmop)
    target_link_libraries(${TARGET} PRIVATE yaehmop)
endfunction()

# avalontoolkit
function(xgd_link_avalontoolkit TARGET)
    add_dependencies(${TARGET} avalontoolkit)
    target_link_libraries(${TARGET} PRIVATE avalontoolkit)
endfunction()

# freesasa
function(xgd_link_freesasa TARGET)
    add_dependencies(${TARGET} freesasa)
    target_link_libraries(${TARGET} PRIVATE freesasa)
endfunction()

# ringdecomposerlib
function(xgd_link_ringdecomposerlib TARGET)
    cmake_parse_arguments(param "PUBLIC" "" "" ${ARGN})
    add_dependencies(${TARGET} ringdecomposerlib)
    if (param_PUBLIC)
        target_link_libraries(${TARGET} PUBLIC ringdecomposerlib)
    else ()
        target_link_libraries(${TARGET} PRIVATE ringdecomposerlib)
    endif ()
endfunction()

# rdkit
function(xgd_link_rdkit TARGET)
    cmake_parse_arguments(param "" "" "PRIVATE;PUBLIC" ${ARGN})
    if ((NOT param_PRIVATE) AND (NOT param_PUBLIC))
        message(FATAL "xgd_link_rdkit: no components given")
    endif ()
    foreach (RDKIT_COMPONENT ${param_PRIVATE})
        # string(TOLOWER ${RDKIT_COMPONENT} RDKIT_COMPONENT_TARGET)
        set(RDKIT_COMPONENT_TARGET ${RDKIT_COMPONENT})
        set(RDKIT_COMPONENT_TARGET rdkit_${RDKIT_COMPONENT_TARGET})
        add_dependencies(${TARGET} ${RDKIT_COMPONENT_TARGET})
        target_link_libraries(${TARGET} PRIVATE ${RDKIT_COMPONENT_TARGET})
    endforeach ()
    foreach (RDKIT_COMPONENT ${param_PUBLIC})
        # string(TOLOWER ${RDKIT_COMPONENT} RDKIT_COMPONENT_TARGET)
        set(RDKIT_COMPONENT_TARGET ${RDKIT_COMPONENT})
        set(RDKIT_COMPONENT_TARGET rdkit_${RDKIT_COMPONENT_TARGET})
        add_dependencies(${TARGET} ${RDKIT_COMPONENT_TARGET})
        target_link_libraries(${TARGET} PUBLIC ${RDKIT_COMPONENT_TARGET})
    endforeach ()
endfunction()

# ncnn
function(xgd_link_ncnn TARGET)
    add_dependencies(${TARGET} ncnn)
    target_link_libraries(${TARGET} PRIVATE ncnn)
endfunction()

# openmp
function(xgd_link_omp TARGET)
    if(ANDROID)
        target_link_libraries(${TARGET} PRIVATE -static-openmp)
    elseif (OpenMP_CXX_FOUND)
        target_link_libraries(${TARGET} PRIVATE OpenMP::OpenMP_CXX)
    else ()
        message(STATUS "openmp: OpenMP_CXX not found for ${TARGET}")
    endif ()
endfunction()

function(xgd_use_header TARGET)
    cmake_parse_arguments(param "" "" "PUBLIC;PRIVATE" ${ARGN})
    macro(xgd_internal_include_header HEADER PUBLIC)
        string(TOLOWER ${HEADER} HEADER_DIR)
        set(HEADER_DIRS)
        if (${HEADER_DIR} STREQUAL "armadillo")
            list(APPEND HEADER_DIRS ${XGD_DEPS_DIR}/cpp/armadillo-src/armadillo/include)
        elseif (${HEADER_DIR} STREQUAL "boost")
            list(APPEND HEADER_DIRS ${XGD_DEPS_DIR}/cpp/boost-src/boost)
        elseif (${HEADER_DIR} STREQUAL "cereal")
            list(APPEND HEADER_DIRS ${XGD_DEPS_DIR}/cpp/cereal-src/cereal/include)
        elseif (${HEADER_DIR} STREQUAL "cutlass")
            list(APPEND HEADER_DIRS ${XGD_DEPS_DIR}/cpp/cutlass-src/cutlass/include)
            list(APPEND HEADER_DIRS ${XGD_DEPS_DIR}/cpp/cutlass-src/cutlass/tools/util/include)
        elseif (${HEADER_DIR} STREQUAL "eigen")
            list(APPEND HEADER_DIRS ${XGD_DEPS_DIR}/cpp/eigen-src/eigen)
        elseif (${HEADER_DIR} STREQUAL "ensmallen")
            list(APPEND HEADER_DIRS ${XGD_DEPS_DIR}/cpp/ensmallen-src/ensmallen/include)
        elseif (${HEADER_DIR} STREQUAL "lbfgs")
            list(APPEND HEADER_DIRS ${XGD_DEPS_DIR}/cpp/lbfgs-src/lbfgs/include)
        elseif (${HEADER_DIR} STREQUAL "mlpack")
            list(APPEND HEADER_DIRS ${XGD_DEPS_DIR}/cpp/mlpack-src/mlpack/src)
        elseif (${HEADER_DIR} STREQUAL "rapidjson")
            list(APPEND HEADER_DIRS ${XGD_DEPS_DIR}/cpp/rapidjson-src/rapidjson/include)
        elseif (${HEADER_DIR} STREQUAL "rxcpp")
            list(APPEND HEADER_DIRS ${XGD_DEPS_DIR}/cpp/rxcpp-src/rxcpp/Rx/v2/src)
        elseif (${HEADER_DIR} STREQUAL "stb")
            list(APPEND HEADER_DIRS ${XGD_DEPS_DIR}/cpp/stb-src/stb)
        elseif (${HEADER_DIR} STREQUAL "taskflow")
            list(APPEND HEADER_DIRS ${XGD_DEPS_DIR}/cpp/taskflow-src/taskflow)
        else ()
            message(FATAL_ERROR "${HEADER_DIR} is not a valid 3rdparty header library")
        endif ()
        if (${PUBLIC})
            target_include_directories(${TARGET} PUBLIC ${HEADER_DIRS})
        else ()
            target_include_directories(${TARGET} PRIVATE ${HEADER_DIRS})
        endif ()
    endmacro()
    macro(xgd_internal_link_header_deps HEADER)
        string(TOLOWER ${HEADER} HEADER_DIR)
        if (${HEADER_DIR} STREQUAL "armadillo")
            target_compile_definitions(${TARGET} PRIVATE ARMA_DONT_USE_LAPACK ARMA_DONT_USE_BLAS)
        elseif (${HEADER_DIR} STREQUAL "boost")
            target_compile_definitions(${TARGET} PRIVATE "_HAS_AUTO_PTR_ETC=0")
        elseif (${HEADER_DIR} STREQUAL "cutlass")
            target_include_directories(${TARGET} PRIVATE ${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES})
            target_link_libraries(${TARGET} PRIVATE CUDA::cudart CUDA::cuda_driver)
        elseif (${HEADER_DIR} STREQUAL "eigen")
            xgd_link_omp(${TARGET})
        elseif (${HEADER_DIR} STREQUAL "mlpack")
            target_compile_definitions(${TARGET} PRIVATE HAS_STB)
            xgd_link_omp(${TARGET})
            xgd_use_header(${TARGET} PRIVATE armadillo cereal ensmallen stb)
        elseif (${HEADER_DIR} STREQUAL "rxcpp")
            xgd_link_threads(${TARGET})
        elseif (${HEADER_DIR} STREQUAL "taskflow")
            xgd_link_threads(${TARGET})
        endif ()
    endmacro()
    foreach (HEADER ${param_PUBLIC})
        xgd_internal_include_header(${HEADER} ON)
    endforeach ()
    foreach (HEADER ${param_PRIVATE})
        xgd_internal_include_header(${HEADER} OFF)
    endforeach ()
    foreach (HEADER ${param_PUBLIC} ${param_PRIVATE})
        xgd_internal_link_header_deps(${HEADER})
    endforeach ()
endfunction()
