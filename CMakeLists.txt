cmake_minimum_required(VERSION 3.4)

include("gate/cmake/HunterGate.cmake")

HunterGate(
  URL "https://github.com/ruslo/hunter/archive/v0.23.214.tar.gz"
  SHA1 "e14bc153a7f16d6a5eeec845fb0283c8fad8c358"
)

project(preload)

cmake_host_system_information(
  RESULT HUNTER_JOBS_NUMBER
  QUERY NUMBER_OF_LOGICAL_CORES
)

hunter_add_package(GTest)
hunter_add_package(gumbo)
hunter_add_package(OpenSSL)
hunter_add_package(rocksdb)
hunter_add_package(Async++)
hunter_add_package(
  Boost
  COMPONENTS
  atomic
  chrono
  # context
  # contract
  # coroutine
  # date_time
  exception
  # fiber
  filesystem
  # graph
  # graph_parallel
  # iostreams
  # locale
  log
  math
  # mpi
  program_options
  # python
  random
  regex
  serialization
  # signals
  # stacktrace
  system
  # test
  thread
  # timer
  # wave
)
