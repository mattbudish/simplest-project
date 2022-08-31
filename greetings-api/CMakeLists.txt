cmake_minimum_required(VERSION 3.1)

## name the project here

set(project_name greetings-api)

project(${project_name})

set(CMAKE_CXX_STANDARD 11)

add_library(${project_name}-lib
        src/AppComponent.hpp
        src/dto/DTOs.hpp
        src/controller/MyController.hpp
)

## link libs

find_package(oatpp 1.3.0 REQUIRED)

target_link_libraries(${project_name}-lib
        PUBLIC oatpp::oatpp
)

## add executables

add_executable(${project_name}-exe
        src/App.cpp
)

target_link_libraries(${project_name}-exe ${project_name}-lib)

target_include_directories(${project_name}-exe PUBLIC src)

add_executable(${project_name}-test
        test/Tests.cpp
        test/MyControllerTest.cpp
        test/MyControllerTest.hpp
        test/app/MyApiTestClient.hpp
        test/app/TestComponent.hpp
)

target_link_libraries(${project_name}-test
        PUBLIC oatpp::oatpp-test
        ${project_name}-lib
)

target_include_directories(${project_name}-test PUBLIC src)

set_target_properties(${project_name}-exe ${project_name}-test PROPERTIES
        CXX_STANDARD 11
        CXX_EXTENSIONS OFF
        CXX_STANDARD_REQUIRED ON
)