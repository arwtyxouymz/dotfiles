############################################
# ITK + VTK
############################################
echo $'\e[32mGetting VTK .............\e[0m'
ghq get git@github.com/InsightSoftwareConsortium/ITK.git
echo $'\e[32mGetting ITK .............\e[0m'
ghq get https://gitlab.kitware.com/vtk/vtk.git


############################################
# VTK
############################################
echo $'\e[32mBuilding VTK .............\e[0m'
VTK_DIR="$HOME/.ghq/gitlab.kitware.com/vtk/vtk/"
mkdir -p ${VTK_DIR}/build
cd ${VTK_DIR}/build

cmake -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/opt \
    ${VTK_DIR}
echo $PASSWORD | sudo -S make -j4
echo $PASSWORD | sudo -S make install

############################################
# ITK
############################################
echo $'\e[32mBuilding ITK .............\e[0m'
ITK_DIR="$HOME/.ghq/github.com/InsightSoftwareConsortium/ITK/"
mkdir -p ${ITK_DIR}/build
cd ${ITK_DIR}/build

cmake -DBUILD_CORE_GEOMETRY=ON \
    -DBUILD_CORE_NUMERICS=ON \
    -DBUILD_CORE_IMAGING=ON \
    -DBUILD_CORE_SERIALISATION=ON \
    -DBUILD_CORE_UTILITIES=ON \
    -DBUILD_VIEWER=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/opt \
    -DModule_ITKVtkGlue=ON \
    ${ITK_DIR}
echo $PASSWORD | sudo -S make -j4
echo $PASSWORD | sudo -S make install
