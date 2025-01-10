# Global arg
ARG ALMA_VERSION=9
ARG EPICS_VERSION="R7.0.8.1"
ARG EPICS_TARGET_ARCH=linux-x86_64
ARG EPICS_HOST_ARCH=linux-x86_64

# Base stage
FROM alma-epics-base:devel AS support

ADD support ${EPICS_ROOT}/support
WORKDIR ${EPICS_ROOT}/support
RUN make 

FROM alma-epics-base:latest
ENV EPICS_SUPPORT=${EPICS_ROOT}/target/support
ENV PATH="$PATH:${EPICS_BASE}/bin/${EPICS_TARGET_ARCH}"
COPY --from=support ${EPICS_ROOT}/target/support ${EPICS_ROOT}/target/support
WORKDIR ${EPICS_ROOT}/target/