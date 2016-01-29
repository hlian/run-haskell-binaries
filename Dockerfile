FROM debian:testing
MAINTAINER Hao Lian <hi@haolian.org>

# The sources.list are US-centric so feel free to modify.
COPY sources.list /etc/apt/sources.list

# libsystemd0 and systemd-sysv both have packaging problems so we
# install them first. Then we dist-upgrade to yank the entire system
# forward.
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y libsystemd0 && apt-get install -y systemd-sysv && apt-get dist-upgrade -y

# These packages are culled from fpco/stack-build's apt-get install
# history. File a PR and ping me if something is missing. The rule is:
# nothing should pull in perl or python or pkg-config; if they do,
# then we're unnecessarily installing build tools instead of just the
# libraries we need.
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --yes \
    bash-completion \
    libadns1 \
    libgmp10 \
    libgnutls30 \
    libgsasl7 \
    libicu55 \
    libncurses5 \
    libpcap0.8 \
    libpcre3 \
    libpq5 \
    sqlite3 \
    libssl1.0.2 \
    libxml2 \
    libyaml-0-2 \
    libzmq3 \
    libnettle6 \
    zlib1g
