project "optick"
	kind "StaticLib"
	language "C++"
	cppdialect "C++11"
    	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	flags { "NoManifest", "FatalWarnings" }

	files {
		"src/**.h",
		"src/**.cpp"
	}
	
	includedirs {
		"src"
	}

	vpaths {
		["api"] = { 
			"src/optick.h",
			"src/optick.config.h",
		},
	}

	defines { "USE_OPTICK=1"}
	defines { "OPTICK_FIBERS=1"}
	defines { "OPTICK_EXPORTS" }
	defines { "OPTICK_ENABLE_GPU_VULKAN=0" }
	defines { "OPTICK_ENABLE_GPU_D3D12=0" }

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
		flags { optimization_flags }

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        	symbols "off"
		flags { optimization_flags }
