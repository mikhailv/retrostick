FROM retrostick-base

RUN git clone -b v1.14.0 --single-branch --depth 1 https://github.com/libretro/RetroArch.git

COPY ./patch/Makefile.gslv5 /build/RetroArch/

COPY ./patch/*.patch ./compile.sh /build/

ENTRYPOINT ["bash", "/build/compile.sh"]
