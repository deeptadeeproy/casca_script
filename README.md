# Casca (v1.0.2)

![Casca Dashboard Screenshot](https://raw.githubusercontent.com/deeptadeeproy/casca_script/release/screenshot.png)

Casca is a system maintenance utility. It uses a 4-quadrant curses user interface. The software runs background update tasks at the same time and monitors the system status in real time.

---

## How to Use Casca

1. Open a terminal window.
2. Type this command:
   ```bash
   sudo casca
   ```
3. Type your administrator password.

---

## Features

* **Parallel Execution Engine**: Runs system updates, repository syncs, and cache cleanup tasks at the same time.
* **Privilege Drop Architecture**: Protects root access. Core operating system tasks run as `root`. User-space helpers (such as `yay` on Arch Linux) run as the `$SUDO_USER` to prevent file corruption.
* **Dynamic 4-Quadrant User Interface**: Automatically detects available package managers on your host system. Adjusts the interface layout to hide unconfigured modules.
* **Status Color Guide**:
  * **Amber**: In Queue
  * **Cyan**: Active / Running
  * **Green**: Complete / Success
  * **Red**: Error / Process Failed

---

## Installation

Casca does not depend on a specific system architecture. Follow the instructions for your Linux distribution.

### Arch Linux

Follow these steps to build and install Casca with `PKGBUILD`:

1. Go to the local directory that contains your build files.
2. Update the package checksums and build the software:
   ```bash
   updpkgsums
   makepkg -sri
   ```
3. Update the package information file:
   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```

### Fedora (`.rpm`)

Follow these steps to install the RPM package:

1. Download the release package: [casca-1.0.2-1.fc44.noarch.rpm](https://github.com/deeptadeeproy/casca_script/releases/download/v1.0.2-noarch/casca-1.0.2-1.fc44.noarch.rpm)
2. Install the package with `dnf`:
   ```bash
   sudo dnf install ./casca-1.0.2-1.fc44.noarch.rpm
   ```

*Note: To remove build dependencies that you do not need, run this command:*

```bash
sudo dnf remove python3-devel --autoremove
```

### Ubuntu / Debian (`.deb`)

Follow these steps to install the Debian package:

1. Download the release package: [casca_1.0.2_all.deb](https://github.com/deeptadeeproy/casca_script/releases/download/v1.0.2-noarch/casca_1.0.2_all.deb)
2. Install the package with `apt`:
   ```bash
   sudo apt install ./casca_1.0.2_all.deb
   ```

> **Warning:** Do not use `dpkg -i`. The `dpkg` tool cannot automatically install required dependencies such as `python3`.

---

## System Architecture

### Safe Sudo and Container Updates

Casca uses non-interactive commands. It stops immediately if an error occurs. This prevents the program from waiting for user input in the background.

When Casca updates Flatpak or Snap packages, it routes commands through the root user correctly and keeps track of the system state inside the user interface.

---

## License

This software is open source under the **MIT License**. Read the `LICENSE` file for more information.
