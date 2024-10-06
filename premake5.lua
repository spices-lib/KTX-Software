project "ktx"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		-- ktx
		"include/ktx.h",
		"include/ktxvulkan.h",

		"lib/**.cpp",
		"lib/**.c",
		"lib/**.h",
		"external/dfdutils/colourspaces.c",
		"external/dfdutils/createdfd.c",
		"external/etcdec/etcdec.cxx",
		"external/dfdutils/interpretdfd.c",
		"external/dfdutils/printdfd.c",
		"external/dfdutils/queries.c",
		"external/dfdutils/vk2dfd.c",

		-- basis_universal
		"external/basisu/encoder/basisu_backend.cpp",
		"external/basisu/encoder/basisu_basis_file.cpp",
		"external/basisu/encoder/basisu_comp.cpp",
		"external/basisu/encoder/basisu_enc.cpp",
		"external/basisu/encoder/basisu_etc.cpp",
		"external/basisu/encoder/basisu_frontend.cpp",
		"external/basisu/encoder/basisu_gpu_texture.cpp",
		"external/basisu/encoder/basisu_pvrtc1_4.cpp",
		"external/basisu/encoder/basisu_resampler.cpp",
		"external/basisu/encoder/basisu_resample_filters.cpp",
		"external/basisu/encoder/basisu_ssim.cpp",
		"external/basisu/encoder/basisu_uastc_enc.cpp",
		"external/basisu/encoder/basisu_bc7enc.cpp",
		"external/basisu/encoder/jpgd.cpp",
		"external/basisu/encoder/basisu_kernels_sse.cpp",
		"external/basisu/encoder/basisu_opencl.cpp",
		"external/basisu/encoder/pvpngreader.cpp",
		"external/basisu/transcoder/basisu_transcoder.cpp",
		"external/basisu/zstd/zstd.c",
	}

	defines
	{
		"DEBUG",
		"LIBKTX",
		"SUPPORT_SOFTWARE_ETC_UNPACK=1",
		"BASISD_SUPPORT_FXT1=0",
		"BASISU_NO_ITERATOR_DEBUG_LEVEL",
		"KTX_FEATURE_KTX1",
		"KTX_FEATURE_KTX2",
		"KTX_FEATURE_WRITE",
		"BASISD_SUPPORT_KTX2_ZSTD=0",
		"BASISD_SUPPORT_KTX2=1",
		"BASISU_SUPPORT_SSE=1",
		"BASISU_SUPPORT_OPENCL=0",
		"ktx_EXPORTS",
		"KHRONOS_STATIC",
		"VKB_DEBUG",
		"ROOT_PATH_SIZE=33",
		"VK_NO_PROTOTYPES",
		"VK_USE_PLATFORM_WIN32_KHR",
	}

	includedirs
	{
		"%{IncludeDir.VulkanSDK}",
		"%{IncludeDir.ktx}",
		"%{IncludeDir.ktx}/include",
		"%{IncludeDir.ktx}/external",
		"%{IncludeDir.ktx}/external/basisu",
		"%{IncludeDir.ktx}/external/basisu/transcoder",
		"%{IncludeDir.ktx}/external/basisu/zstd",
		"%{IncludeDir.ktx}/other_include",
		"%{IncludeDir.ktx}/utils",
		"%{IncludeDir.ktx}/lib",
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
