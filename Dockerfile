FROM arm64v8/ubuntu:22.04

WORKDIR /workspace

RUN apt update
RUN apt install -y debhelper-compat directx-headers-dev glslang-tools meson quilt \
                   libdrm-dev libx11-dev libxxf86vm-dev libsensors-dev libxfixes-dev \
                   libxext-dev libva-dev libvdpau-dev libvulkan-dev x11proto-dev \
                   libx11-xcb-dev libxcb-dri2-0-dev libxcb-glx0-dev libxcb-xfixes0-dev \
                   libxcb-dri3-dev libxcb-present-dev libxcb-randr0-dev libxcb-shm0-dev \
                   libxcb-sync-dev libxrandr-dev libxshmfence-dev libzstd-dev python3-mako \
                   libwayland-dev libwayland-egl-backend-dev llvm-15-dev libclang-15-dev \
                   libclang-cpp15-dev libclc-15-dev wayland-protocols libglvnd-core-dev \
                   valgrind rustc bindgen llvm-spirv-15 libclc-15 libllvmspirvlib-15-dev \
                   pkg-config libexpat1-dev python3-ply python3-setuptools flex bison \
                   libelf-dev zlib1g-dev git make gcc cmake dpkg-dev
RUN git clone --depth=1 https://git.launchpad.net/ubuntu/+source/mesa -b applied/ubuntu/jammy-devel
COPY add-sunxi-drm.patch /workspace/mesa/add-sunxi-drm.patch
RUN cd mesa && patch -p1 < add-sunxi-drm.patch && dpkg-buildpackage
