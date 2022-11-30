FROM registry.fedoraproject.org/fedora-toolbox:37
MAINTAINER Chris Collins <collins.christopher@gmail.com>

ENV PKGS "ansible" 
ENV COLLECTIONS "community.general ansible.posix"

RUN dnf --assumeyes install $PKGS \
  && dnf clean all \
  && rm -rf /var/cache/yum

RUN ansible-galaxy collection install $COLLECTIONS
