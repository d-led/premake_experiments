local run_target_after_build = function ()
	configuration {"xcode*" }
		postbuildcommands {"$TARGET_BUILD_DIR/$TARGET_NAME"}

	configuration {"gmake"}
		postbuildcommands  { "$(TARGET)" }

	configuration {"codeblocks" }
		postbuildcommands { "$(TARGET_OUTPUT_FILE)"}

	configuration { "vs*"}
		postbuildcommands { "\"$(TargetPath)\"" }

	configuration { "*" }
end

-------------------
workspace "example"
    configurations { "Debug", "Release" }

    source_root = path.getabsolute("..")
    print("source root is: "..source_root)

    -- build files location
    location(os.target() .. "/" .. _ACTION)

    -- output file locations
    objdir ("../obj/%{cfg.system}/%{prj.name}")
    targetdir ("../bin/%{cfg.system}/%{prj.name}/%{cfg.name}")

    filter "configurations:Debug"
        architecture "x86_64"
        symbols "On"

    filter "configurations:Release"
        architecture "x86_64"
        symbols "On"
        optimize "On"

    filter "action:gmake"
        linkoptions  { "-std=c++11" }
        buildoptions { "-std=c++11" } --, "-stdlib=libc++"
    
    filter {}

    -------------
    project "test"
        kind "ConsoleApp"
        language "C++"

        files {
            source_root .. "/src/test/*.cpp",
            source_root .. "/src/test/*.h",
        }

        postbuildmessage 'Copying the resource file to the target dir'
        postbuildcommands {
            "{COPY} ../../../res/%{os.target()}/data.txt %{cfg.targetdir}"
        }
        buildinputs { source_root .. "/res/%{os.target()}/data.txt" }
        buildoutputs { "%{cfg.targetdir}/data.txt" }

        run_target_after_build()

