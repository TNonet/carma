CMAKE_MINIMUM_REQUIRED(VERSION 3.12)

IF (DEV_DEBUG_MODE)
    SET(DEV_MODE "ON")
    SET(ENABLE_CARMA_EXTRA_DEBUG "ON")
ENDIF ()

IF (DEV_MODE)
    SET(BUILD_TESTS ON)
    SET(CMAKE_EXPORT_COMPILE_COMMANDS 1)
    SET(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/build)
ENDIF ()

IF (ENABLE_CARMA_EXTRA_DEBUG)
    SET(CARMA_EXTRA_DEBUG "ON")
    ADD_DEFINITIONS(-DCARMA_EXTRA_DEBUG)
ENDIF ()

IF (ENABLE_CARMA_SOFT_STEAL AND ENABLE_CARMA_HARD_STEAL)
    MESSAGE(WARNING "CARMA Configuration: both CARMA_HARD_STEAL and CARMA_SOFT_STEAL were enabled, CARMA_HARD_STEAL has been unset")
    SET(ENABLE_CARMA_HARD_STEAL OFF)
ENDIF ()

IF (ENABLE_CARMA_SOFT_STEAL)
    SET(CARMA_SOFT_STEAL "ON")
    ADD_DEFINITIONS(-DCARMA_SOFT_STEAL)
ENDIF ()

IF (ENABLE_CARMA_HARD_STEAL)
    SET(CARMA_HARD_STEAL "ON")
    ADD_DEFINITIONS(-DCARMA_HARD_STEAL)
ENDIF ()

IF (ENABLE_CARMA_DONT_REQUIRE_OWNDATA)
    SET(CARMA_DONT_REQUIRE_OWNDATA "ON")
    ADD_DEFINITIONS(-DCARMA_DONT_REQUIRE_OWNDATA)
ENDIF ()

IF (ENABLE_CARMA_DONT_REQUIRE_F_CONTIGUOUS)
    SET(CARMA_DONT_REQUIRE_F_CONTIGUOUS "ON")
    ADD_DEFINITIONS(-DCARMA_DONT_REQUIRE_F_CONTIGUOUS)
ENDIF ()

IF (DEFINED Python3_EXECUTABLE AND NOT DEFINED PYTHON_EXECUTABLE)
    SET(PYTHON_EXECUTABLE ${Python3_EXECUTABLE})
ELSEIF (DEFINED PYTHON_EXECUTABLE AND NOT DEFINED Python3_EXECUTABLE)
    SET(Python3_EXECUTABLE ${PYTHON_EXECUTABLE})
ENDIF ()


IF (DEV_MODE OR DEV_DEBUG_MODE)
    MESSAGE(STATUS "carma: dev mode: ${DEV_MODE}")
    MESSAGE(STATUS "carma: dev debug mode: ${DEV_DEBUG_MODE}")
ENDIF ()
MESSAGE(STATUS "carma: enable extra debug: ${ENABLE_CARMA_EXTRA_DEBUG}")
MESSAGE(STATUS "carma: enable soft steal: ${ENABLE_CARMA_SOFT_STEAL}")
MESSAGE(STATUS "carma: enable hard steal: ${ENABLE_CARMA_HARD_STEAL}")
MESSAGE(STATUS "carma: don't require owndata: ${ENABLE_CARMA_DONT_REQUIRE_OWNDATA}")
MESSAGE(STATUS "carma: don't require f-contiguous: ${ENABLE_CARMA_DONT_REQUIRE_F_CONTIGUOUS}")
