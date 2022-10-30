FROM archlinux:latest

# Create temp folder
RUN mkdir /tmp/becca
RUN chmod 777 /tmp/becca

# Initialize pacman & install everything required for makepkg
RUN pacman-key --init
RUN pacman -Syu --noconfirm base-devel git

# Create a user & setup yay for AUR packages
RUN useradd -m builder
COPY sudoers.cat /tmp/becca/sudoers.cat
RUN cat /tmp/becca/sudoers.cat >> /etc/sudoers
USER builder
RUN cd /tmp && git clone https://aur.archlinux.org/yay
RUN cd /tmp/yay && makepkg -si --noconfirm

# Install toolchain for linux
RUN yay -S --noconfirm cmake clang

# Install toolchain for windows
RUN yay -S --noconfirm mingw-w64-cmake

# Install toolchain for switch homebrew
RUN yay -S --noconfirm wget
RUN sudo pacman-key --recv BC26F752D25B92CE272E0F44F7FD5492264BB9D0 --keyserver keyserver.ubuntu.com
RUN sudo pacman-key --lsign BC26F752D25B92CE272E0F44F7FD5492264BB9D0
RUN wget https://pkg.devkitpro.org/devkitpro-keyring.pkg.tar.xz -O /tmp/becca/dkp-keyring.tar.xz
RUN sudo pacman -U --noconfirm /tmp/becca/dkp-keyring.tar.xz
COPY pacman.conf.cat /tmp/becca/pacman.conf.cat
RUN sudo sh -c "cat /tmp/becca/pacman.conf.cat >> /etc/pacman.conf"
RUN yay -Syy
RUN yay -S --noconfirm switch-dev

# Setup directory containing sourcetree
VOLUME /code
WORKDIR /code

# Setup entrypoint
COPY entry.sh /entry.sh
RUN sudo chmod +x /entry.sh
ENTRYPOINT /entry.sh
