# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "Alarm_autogen"
  "CMakeFiles/Alarm_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/Alarm_autogen.dir/ParseCache.txt"
  )
endif()
