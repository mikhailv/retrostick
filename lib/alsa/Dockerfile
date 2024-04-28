FROM retrostick-base

RUN git clone -b v1.1.9 --single-branch --depth 1 https://github.com/alsa-project/alsa-lib.git

WORKDIR /build/alsa-lib

ADD compile.sh .

ENTRYPOINT ["bash", "/build/alsa-lib/compile.sh"]
