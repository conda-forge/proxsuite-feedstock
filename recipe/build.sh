#!/bin/sh

if [ "$(uname)" == "Darwin" ]; then
  # for Mac OSX
  export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

mkdir build
cd build

cmake ${CMAKE_ARGS} .. \
      -GNinja \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_TESTING:BOOL=OFF \
      -DINSTALL_DOCUMENTATION:BOOL=ON \
      -DBUILD_PYTHON_INTERFACE:BOOL=ON \
      -DBUILD_WITH_VECTORIZATION_SUPPORT:BOOL=ON \
      -DBUILD_WITH_OPENMP_SUPPORT:BOOL=ON \
      -DPython_EXECUTABLE=$PYTHON

ninja -j${CPU_COUNT}
ninja install
