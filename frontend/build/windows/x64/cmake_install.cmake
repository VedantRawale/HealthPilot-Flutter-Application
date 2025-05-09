# Install script for directory: C:/Users/rawal/.vscode/HealthPilot/health_pilot/windows

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "$<TARGET_FILE_DIR:health_pilot>")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/flutter/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/app_links/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/firebase_core/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/firebase_storage/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/flutter_secure_storage_windows/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/url_launcher_windows/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/flutter_local_notifications_windows/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug/health_pilot.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug" TYPE EXECUTABLE FILES "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug/health_pilot.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile/health_pilot.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile" TYPE EXECUTABLE FILES "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile/health_pilot.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release/health_pilot.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release" TYPE EXECUTABLE FILES "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release/health_pilot.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug/data" TYPE FILE FILES "C:/Users/rawal/.vscode/HealthPilot/health_pilot/windows/flutter/ephemeral/icudtl.dat")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile/data" TYPE FILE FILES "C:/Users/rawal/.vscode/HealthPilot/health_pilot/windows/flutter/ephemeral/icudtl.dat")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release/data" TYPE FILE FILES "C:/Users/rawal/.vscode/HealthPilot/health_pilot/windows/flutter/ephemeral/icudtl.dat")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug" TYPE FILE FILES "C:/Users/rawal/.vscode/HealthPilot/health_pilot/windows/flutter/ephemeral/flutter_windows.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile" TYPE FILE FILES "C:/Users/rawal/.vscode/HealthPilot/health_pilot/windows/flutter/ephemeral/flutter_windows.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release" TYPE FILE FILES "C:/Users/rawal/.vscode/HealthPilot/health_pilot/windows/flutter/ephemeral/flutter_windows.dll")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug/app_links_plugin.dll;C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug/firebase_core_plugin.lib;C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug/firebase_storage_plugin.lib;C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug/flutter_secure_storage_windows_plugin.dll;C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug/url_launcher_windows_plugin.dll;C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug/flutter_local_notifications_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug" TYPE FILE FILES
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/app_links/Debug/app_links_plugin.dll"
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/firebase_core/Debug/firebase_core_plugin.lib"
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/firebase_storage/Debug/firebase_storage_plugin.lib"
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/flutter_secure_storage_windows/Debug/flutter_secure_storage_windows_plugin.dll"
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/url_launcher_windows/Debug/url_launcher_windows_plugin.dll"
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/flutter_local_notifications_windows/shared/Debug/flutter_local_notifications_windows.dll"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile/app_links_plugin.dll;C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile/firebase_core_plugin.lib;C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile/firebase_storage_plugin.lib;C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile/flutter_secure_storage_windows_plugin.dll;C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile/url_launcher_windows_plugin.dll;C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile/flutter_local_notifications_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile" TYPE FILE FILES
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/app_links/Profile/app_links_plugin.dll"
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/firebase_core/Profile/firebase_core_plugin.lib"
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/firebase_storage/Profile/firebase_storage_plugin.lib"
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/flutter_secure_storage_windows/Profile/flutter_secure_storage_windows_plugin.dll"
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/url_launcher_windows/Profile/url_launcher_windows_plugin.dll"
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/flutter_local_notifications_windows/shared/Profile/flutter_local_notifications_windows.dll"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release/app_links_plugin.dll;C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release/firebase_core_plugin.lib;C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release/firebase_storage_plugin.lib;C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release/flutter_secure_storage_windows_plugin.dll;C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release/url_launcher_windows_plugin.dll;C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release/flutter_local_notifications_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release" TYPE FILE FILES
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/app_links/Release/app_links_plugin.dll"
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/firebase_core/Release/firebase_core_plugin.lib"
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/firebase_storage/Release/firebase_storage_plugin.lib"
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/flutter_secure_storage_windows/Release/flutter_secure_storage_windows_plugin.dll"
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/url_launcher_windows/Release/url_launcher_windows_plugin.dll"
      "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/plugins/flutter_local_notifications_windows/shared/Release/flutter_local_notifications_windows.dll"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    
  file(REMOVE_RECURSE "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug/data/flutter_assets")
  
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    
  file(REMOVE_RECURSE "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile/data/flutter_assets")
  
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    
  file(REMOVE_RECURSE "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release/data/flutter_assets")
  
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Debug/data" TYPE DIRECTORY FILES "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build//flutter_assets")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile/data" TYPE DIRECTORY FILES "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build//flutter_assets")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release/data" TYPE DIRECTORY FILES "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build//flutter_assets")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile/data/app.so")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Profile/data" TYPE FILE FILES "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/app.so")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release/data/app.so")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/runner/Release/data" TYPE FILE FILES "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/app.so")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "C:/Users/rawal/.vscode/HealthPilot/health_pilot/build/windows/x64/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
