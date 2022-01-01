cmake_minimum_required(VERSION 3.12)

project(CMGDB)

cmake_policy(SET CMP0054 NEW)

# Visual Studio C++ does not support keywords such
# as "and", "not", etc. Settting the /permissive-
# flag for the compiler makes it suppor them.
if(MSVC)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /permissive-")
endif()

if(APPLE)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -stdlib=libc++")
endif(APPLE)

add_subdirectory(pybind11)


message("CMAKE_SOURCE_DIR IS ${CMAKE_SOURCE_DIR}")

set(BOOST_ROOT ${CMAKE_SOURCE_DIR}/boost/boost)
message("BOOST_ROOT IS ${BOOST_ROOT}")
find_package(Boost)


# set(BOOST_ROOT /home/runner/work/CMGDB_temp/CMGDB_temp/boost/boost)
# set(Boost_INCLUDE_DIR /home/runner/work/CMGDB_temp/CMGDB_temp/boost/boost/include)

# set(Boost_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/boost/include)
# set(BOOST_ROOT ${CMAKE_SOURCE_DIR}/boost)

# if(NOT DEFINED BOOST_ROOT)
#   set(BOOST_ROOT $ENV{BOOST_ROOT})
# endif()

# set(BOOST_ROOT /home/runner/work/CMGDB_temp/CMGDB_temp/boost/boost)
# set(Boost_INCLUDE_DIR ${BOOST_ROOT}/include)
# set(Boost_INCLUDEDIR ${BOOST_ROOT}/include)

# message("BOOST_ROOT IS ${BOOST_ROOT}")
# message("Boost_INCLUDE_DIR IS ${Boost_INCLUDE_DIR}")
# message("Boost_INCLUDEDIR IS ${Boost_INCLUDEDIR}")
# message("BOOST_ROOT IS $ENV{BOOST_ROOT}")

# if(UNIX AND NOT APPLE)
#   set(Boost_INCLUDE_DIR /usr/share/miniconda3/include/boost)
# endif()

# set(BOOST_ROOT /usr/share/miniconda3)
# set(BOOST_INCLUDEDIR /usr/share/miniconda3/include/boost)

# message("Boost_INCLUDE_DIR IS ${Boost_INCLUDE_DIR}")
# message("BOOST_ROOT IS ${BOOST_ROOT}")
# message("BOOST_INCLUDEDIR IS ${BOOST_INCLUDEDIR}")

# set(BOOST_INCLUDEDIR /usr/share/miniconda3/include)

set(Boost_INCLUDE_DIR /usr/share/miniconda/include)
set(Boost_INCLUDE_DIR2 /usr/share/miniconda/include/boost)

if(UNIX AND NOT APPLE)
  set(BOOST_ROOT /usr/local)
endif()

message("BOOST_ROOT IS ${BOOST_ROOT}")

# find_package(filesystem REQUIRED CONFIG)
# find_package(Boost CONFIG)
# find_package(Boost COMPONENTS chrono thread serialization)
# find_package(Boost COMPONENTS chrono thread serialization REQUIRED)

if(Boost_FOUND)
  message(STATUS "Success!")
endif()

include_directories (
  ${Boost_INCLUDE_DIR}
  ${Boost_INCLUDE_DIR2}
  /usr/local/include
  # /usr/share/miniconda3/include
  ${CMAKE_SOURCE_DIR}/include
  ${USER_INCLUDE_PATH}/database
  ${USER_INCLUDE_PATH} )

link_directories (
  /usr/share/miniconda3/lib
  /usr/local/lib
  ${USER_LIBRARY_PATH} )

message("USER INCLUDE PATH IS ${USER_INCLUDE_PATH}")

pybind11_add_module(_cmgdb src/CMGDB/_cmgdb/CMGDB.cpp)

# target_link_libraries (
#   _cmgdb PRIVATE
#   boost_chrono
#   boost_thread
#   boost_wserialization
#   sdsl )

target_link_libraries ( _cmgdb PRIVATE sdsl )

# target_link_libraries (
#   _cmgdb PRIVATE
#   Boost::chrono
#   Boost::thread
#   Boost::serialization
#   sdsl )
