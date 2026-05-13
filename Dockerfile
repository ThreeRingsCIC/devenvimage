# This Dockerfile builds a development environment that's very closely-aligned with the production environment.
# It's based on Debian 12, the same as we use in production.

# Start from Debian 12
FROM debian:12

# Use a Login Shell, so RVM functions properly:
SHELL [ "/bin/bash", "-l", "-c" ]

# Install updates and prerequisites
RUN apt update && apt upgrade -y
RUN apt install -y nfs-common cron git clamav clamav-daemon libreoffice imagemagick mariadb-client libfreeimage-dev jq libmariadb-dev shared-mime-info wget gnupg2 bzip2 gawk g++ gcc autoconf automake bison libc6-dev libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev make pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev libssl-dev dirmngr gnupg apt-transport-https ca-certificates curl wkhtmltopdf procps

# Update ClamAV signatures
RUN freshclam

# Install RVM for Ruby version management: this makes it easier for us to upgrade by point releases in production.
RUN gpg2 --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN \curl -sSL https://get.rvm.io | bash -s stable

# Ruby 3.0.x requires OpenSSL 1.x, but Debian 12+ only comes with packages for OpenSSL 3.x, so we need to compile our own.
# (Ruby 3.1.x+ support OpenSSL 3.x out of the box, so things will get easier from then; but we've got to be ready for Rails 7.0.1+ for that!)
# The 'make TESTS=-test_afalg test' disables a test that's known-broken (https://github.com/openssl/openssl/issues/12242) on
# this Linux kernel when emulating x86 using an arm64 CPU (e.g. Apple Silicon) [means we can 'docker build' on a Mac].
RUN cd /root && wget https://www.openssl.org/source/openssl-1.1.1w.tar.gz && tar zxvf openssl-1.1.1w.tar.gz
RUN cd /root/openssl-1.1.1w && ./config --prefix=/etc/openssl-1.1.1w --openssldir=/etc/openssl-1.1.1w && make && make TESTS=-test_afalg test && make install && cd /root
RUN cp -r /usr/lib/ssl/certs/* /etc/openssl-1.1.1w/certs/

# Install Ruby 3.0.7, using the OpenSSL 1.1.1w we compiled above:
RUN rvm install --with-openssl-dir=/etc/openssl-1.1.1w 3.0.7

# Install `wait`, a utility that can help our entrypoint script wait for the DB server to come up before it starts trying to use it
# https://github.com/ufoscout/docker-compose-wait/
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /usr/local/bin/wait
RUN chmod +x /usr/local/bin/wait

# Install and precompile binaries for Passenger so we can use Passenger Standalone
RUN gem install passenger
RUN passenger-config build-native-support
RUN passenger-config install-standalone-runtime

# Create a wrapper script for login shell called `bash-login`; we can run this to ensure that the shell is always a login shell, which RVM needs
RUN echo -e '#!/bin/bash\nexec /bin/bash -l' > /bin/bash-login && chmod +x /bin/bash-login

# Change the default shell for root to the `bash-login` wrapper, so any `docker exec` into this container will use a login shell!
RUN sed -i 's|/bin/bash|/bin/bash-login|' /etc/passwd

CMD [ "/usr/bin/bash", "-l" ]