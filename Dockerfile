FROM scratch

COPY ./seed/stage0-posix/x86/ /x86/
COPY ./seed/stage0-posix/M2-Mesoplanet/ /M2-Mesoplanet/
COPY ./seed/stage0-posix/M2-Planet/ /M2-Planet/
COPY ./seed/stage0-posix/M2libc/ /M2libc/
COPY ./seed/stage0-posix/bootstrap-seeds/ /bootstrap-seeds/
COPY ./seed/stage0-posix/mescc-tools/ /mescc-tools/
COPY ./seed/stage0-posix/mescc-tools-extra/ /mescc-tools-extra/
COPY ./seed/stage0-posix/kaem.x86 /kaem.x86
COPY ./seed/stage0-posix/x86.answers /x86.answers

COPY ./seed/configurator.c /configurator.c
COPY ./seed/configurator.x86.checksums /configurator.x86.checksums
COPY ./seed/preseeded.kaem /preseeded.kaem
COPY ./seed/script-generator.c /script-generator.c
COPY ./seed/script-generator.x86.checksums /script-generator.x86.checksums
COPY ./seed/seed.kaem /seed.kaem
COPY ./seed/after.kaem /after.kaem

COPY ./steps/ /steps/
COPY ./bootstrap.cfg.docker /steps/bootstrap.cfg
COPY ./distfiles/ /external/distfiles/
COPY ./seed/stage0-posix/bootstrap-seeds/POSIX/x86/kaem-optional-seed /init

RUN ["/init"]
