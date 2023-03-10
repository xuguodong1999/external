macro(xgd_build_ncnn_omp_pthread)
    xgd_add_library(
            ncnn_omp
            STATIC
            SRC_FILES ${NCNN_OMP_SRC}
            INCLUDE_DIRS ${NCNN_INC_DIR}
    )
    set_target_properties(ncnn_omp PROPERTIES LINKER_LANGUAGE C)
    target_include_directories(ncnn_omp PUBLIC ${NCNN_GEN_BASE_INC_DIR} ${NCNN_GEN_INC_DIR})
    target_compile_definitions(ncnn_omp PUBLIC NCNN_SIMPLEOMP)
    if (IOS OR APPLE)
        target_compile_options(ncnn_omp PUBLIC -Xpreprocessor -fopenmp)
    else ()
        target_compile_options(ncnn_omp PUBLIC -fopenmp)
    endif ()
    xgd_link_threads(ncnn_omp PUBLIC)
endmacro()

function(xgd_build_ncnn_library)
    set(NCNN_INC_DIR ${XGD_EXTERNAL_DIR}/cpp/ncnn-src/ncnn/src)
    set(NCNN_SRC_DIR ${NCNN_INC_DIR})
    set(NCNN_GEN_BASE_INC_DIR ${XGD_GENERATED_DIR}/ncnn/include)
    set(NCNN_GEN_INC_DIR ${NCNN_GEN_BASE_INC_DIR}/ncnn)
    set(NCNN_CMAKE_DIR ${XGD_EXTERNAL_DIR}/cpp/ncnn-src/ncnn/cmake)
    set(NCNN_OMP_SRC ${NCNN_SRC_DIR}/simpleomp.cpp ${NCNN_SRC_DIR}/cpu.cpp)
    xgd_add_library(
            ncnn
            SRC_DIRS ${NCNN_SRC_DIR}
            INCLUDE_DIRS ${NCNN_INC_DIR}
            EXCLUDE_SRC_FILES ${NCNN_OMP_SRC}
    )
    if (XGD_ENABLE_VULKAN_COMP)
        set(NCNN_VULKAN ON)
        set(NCNN_SYSTEM_GLSLANG ON)
    endif ()
    xgd_link_omp(ncnn)
    get_target_property(XGD_OMP_LINKED ncnn XGD_OMP_LINKED)
    if (XGD_OMP_LINKED OR (EMSCRIPTEN AND NOT XGD_WASM_NODE)) # disable simpleomp for wasm web
        target_sources(ncnn PRIVATE ${NCNN_OMP_SRC})
    else ()
        set(NCNN_SIMPLEOMP ON)
        xgd_build_ncnn_omp_pthread()
        xgd_link_ncnn_omp(ncnn)
    endif ()
    if (NOT EMSCRIPTEN)
        set(NCNN_RUNTIME_CPU ON)
    endif ()
    set(NCNN_SIMPLEOCV ON)
    set(NCNN_INT8 ON)
    set(NCNN_BF16 ON)
    set(NCNN_C_API ON)
    set(NCNN_STDIO ON)
    set(NCNN_THREADS ON)
    set(NCNN_STRING ON)
    set(NCNN_PIXEL ON)
    set(NCNN_PIXEL_ROTATE ON)
    set(NCNN_PIXEL_AFFINE ON)
    set(NCNN_PIXEL_DRAWING ON)
    set(NCNN_VERSION_STRING 1.0.20221128)
    xgd_generate_export_header(ncnn "ncnn" ".h")
    if (XGD_ARCH_X86)
        set(NCNN_TARGET_ARCH x86)
        if (XGD_FLAG_AVX2)
            set(NCNN_SSE2 ON)
            set(NCNN_AVX ON)
            set(NCNN_AVX2 ON)
            set(NCNN_FMA ON)
            set(NCNN_XOP ON)
            set(NCNN_F16C ON)
        elseif (XGD_FLAG_AVX)
            set(NCNN_SSE2 ON)
            set(NCNN_AVX ON)
        elseif (XGD_FLAG_SSE)
            set(NCNN_SSE2 ON)
        endif ()
    elseif (XGD_ARCH_POWER)
        set(NCNN_TARGET_ARCH powerpc)
    elseif (XGD_ARCH_MIPS)
        set(NCNN_TARGET_ARCH mpis)
    elseif (XGD_ARCH_ARM32 OR XGD_ARCH_ARM64)
        set(NCNN_TARGET_ARCH arm)
        set(NCNN_ARM82 ON)
        set(NCNN_ARM82DOT ON)
        set(NCNN_ARM82FP16FML ON)
        set(NCNN_ARM84BF16 ON)
        set(NCNN_ARM84I8MM ON)
        set(NCNN_ARM86SVE ON)
        set(NCNN_ARM86SVE2 ON)
        set(NCNN_ARM86SVEBF16 ON)
        set(NCNN_ARM86SVEI8MM ON)
        set(NCNN_ARM86SVEF32MM ON)
    endif ()

    if (NCNN_TARGET_ARCH)
        target_include_directories(ncnn PRIVATE ${NCNN_SRC_DIR}/layer)
        target_include_directories(ncnn PRIVATE ${NCNN_SRC_DIR}/layer/${NCNN_TARGET_ARCH})
        target_include_directories(ncnn PRIVATE ${NCNN_GEN_INC_DIR}/layer/${NCNN_TARGET_ARCH})
    endif ()

    set(ncnn_SRCS)
    include(${NCNN_CMAKE_DIR}/ncnn_add_shader.cmake)
    include(${NCNN_CMAKE_DIR}/ncnn_add_layer.cmake)

    set(NCNN_SHADER_SPV_HEX_FILES)
    set(__LAYER_TYPE_ENUM_INDEX 0)
    set(__LAYER_SHADER_TYPE_ENUM_INDEX 0)

    ncnn_add_layer(AbsVal)
    ncnn_add_layer(ArgMax OFF)
    ncnn_add_layer(BatchNorm)
    ncnn_add_layer(Bias)
    ncnn_add_layer(BinaryOp)
    ncnn_add_layer(BNLL)
    ncnn_add_layer(Cast)
    ncnn_add_layer(Clip)
    ncnn_add_layer(Concat)
    ncnn_add_layer(Convolution)
    ncnn_add_layer(Convolution1D)
    ncnn_add_layer(Convolution3D)
    ncnn_add_layer(ConvolutionDepthWise)
    ncnn_add_layer(ConvolutionDepthWise1D)
    ncnn_add_layer(ConvolutionDepthWise3D)
    ncnn_add_layer(Crop)
    ncnn_add_layer(Deconvolution)
    ncnn_add_layer(Deconvolution1D)
    ncnn_add_layer(Deconvolution3D)
    ncnn_add_layer(DeconvolutionDepthWise)
    ncnn_add_layer(DeconvolutionDepthWise1D)
    ncnn_add_layer(DeconvolutionDepthWise3D)
    ncnn_add_layer(DeepCopy)
    ncnn_add_layer(DeformableConv2D)
    ncnn_add_layer(Dequantize)
    ncnn_add_layer(DetectionOutput)
    ncnn_add_layer(Dropout)
    ncnn_add_layer(Einsum)
    ncnn_add_layer(Eltwise)
    ncnn_add_layer(ELU)
    ncnn_add_layer(Embed)
    ncnn_add_layer(Exp)
    ncnn_add_layer(ExpandDims)
    ncnn_add_layer(Flatten)
    ncnn_add_layer(Fold)
    ncnn_add_layer(GELU)
    ncnn_add_layer(Gemm)
    ncnn_add_layer(GLU)
    ncnn_add_layer(GridSample)
    ncnn_add_layer(GroupNorm)
    ncnn_add_layer(GRU)
    ncnn_add_layer(HardSigmoid)
    ncnn_add_layer(HardSwish)
    ncnn_add_layer(InnerProduct)
    ncnn_add_layer(Input)
    ncnn_add_layer(InstanceNorm)
    ncnn_add_layer(Interp)
    ncnn_add_layer(LayerNorm)
    ncnn_add_layer(Log)
    ncnn_add_layer(LRN)
    ncnn_add_layer(LSTM)
    ncnn_add_layer(MatMul)
    ncnn_add_layer(MemoryData)
    ncnn_add_layer(Mish)
    ncnn_add_layer(MultiHeadAttention)
    ncnn_add_layer(MVN)
    ncnn_add_layer(Noop)
    ncnn_add_layer(Normalize)
    ncnn_add_layer(Packing)
    ncnn_add_layer(Padding)
    ncnn_add_layer(Permute)
    ncnn_add_layer(PixelShuffle)
    ncnn_add_layer(Pooling)
    ncnn_add_layer(Pooling1D)
    ncnn_add_layer(Pooling3D)
    ncnn_add_layer(Power)
    ncnn_add_layer(PReLU)
    ncnn_add_layer(PriorBox)
    ncnn_add_layer(Proposal)
    ncnn_add_layer(PSROIPooling)
    ncnn_add_layer(Quantize)
    ncnn_add_layer(Reduction)
    ncnn_add_layer(ReLU)
    ncnn_add_layer(Reorg)
    ncnn_add_layer(Requantize)
    ncnn_add_layer(Reshape)
    ncnn_add_layer(RNN)
    ncnn_add_layer(ROIAlign)
    ncnn_add_layer(ROIPooling)
    ncnn_add_layer(Scale)
    ncnn_add_layer(SELU)
    ncnn_add_layer(ShuffleChannel)
    ncnn_add_layer(Sigmoid)
    ncnn_add_layer(Slice)
    ncnn_add_layer(Softmax)
    ncnn_add_layer(Softplus)
    ncnn_add_layer(Split)
    ncnn_add_layer(SPP OFF)
    ncnn_add_layer(Squeeze)
    ncnn_add_layer(StatisticsPooling)
    ncnn_add_layer(Swish)
    ncnn_add_layer(TanH)
    ncnn_add_layer(Threshold)
    ncnn_add_layer(Tile)
    ncnn_add_layer(UnaryOp)
    ncnn_add_layer(Unfold)
    ncnn_add_layer(YoloDetectionOutput)
    ncnn_add_layer(Yolov3DetectionOutput)

    if (NCNN_VULKAN)
        ncnn_add_shader(${NCNN_SRC_DIR}/convert_ycbcr.comp)
        ncnn_add_shader(${NCNN_SRC_DIR}/layer/vulkan/shader/vulkan_activation.comp)
    endif ()

    add_custom_target(ncnn-generate-spirv DEPENDS ${NCNN_SHADER_SPV_HEX_FILES})
    add_dependencies(ncnn ncnn-generate-spirv)

    set(TO_CONFIGURE_FILES
            platform.h
            layer_registry.h
            layer_type_enum.h
            layer_shader_registry.h
            layer_shader_spv_data.h
            layer_shader_type_enum.h
            layer_declaration.h)
    foreach (TO_CONFIGURE_FILE ${TO_CONFIGURE_FILES})
        configure_file(
                ${NCNN_SRC_DIR}/${TO_CONFIGURE_FILE}.in
                ${NCNN_GEN_INC_DIR}/${TO_CONFIGURE_FILE}
        )
    endforeach ()

    target_include_directories(ncnn PUBLIC ${NCNN_GEN_INC_DIR})
    if (WIN32)
        target_compile_definitions(ncnn PRIVATE NOMINMAX)
    endif ()
    if (ncnn_SRCS)
        target_sources(ncnn PRIVATE ${ncnn_SRCS})
    endif ()
    if (NCNN_VULKAN)
        target_include_directories(ncnn PRIVATE ${NCNN_GEN_INC_DIR}/layer/vulkan/shader ${NCNN_SRC_DIR}/layer)
        xgd_link_vulkan(ncnn)
    endif ()
    xgd_use_header(ncnn PRIVATE stb)
endfunction()
