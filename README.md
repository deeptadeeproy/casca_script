# casca (v1.0.2)

![casca Dashboard Screenshot](https://raw.githubusercontent.com/deeptadeeproy/casca_script/release/screenshot.png)

A `btop`-style concurrent multi-channel system maintenance utility utilizing a full-screen, highly responsive 4-quadrant curses TUI dashboard. `casca` safely parallelizes distinct packaging subsystems, managing root-level upgrades while strictly tracking execution states in real time.

---
## 👨🏻‍💻 Usage

Type the following command in the terminal after install and type in admin password
```bash
    sudo casca
```

---
## ✨ Features

* **Parallel Execution Engine**: Concurrently handles core system updates, repository syncs, and cache cleanups without serial blocking bottlenecks.
* **Privilege Drop Architecture**: Implements strict sudo-safety checks. Core OS sweeps run as root, while user-space helpers (like Arch's `yay`) drop privileges back to the calling `$SUDO_USER` to prevent repository corruption.
* **Dynamic 4-Quadrant UI**: A responsive curses interface that automatically probes the host system for supported subsystems and recalculates layout geometry on launch to hide unconfigured modules.
* **State-Driven TUI Color Mapping**:
  * 🟡 **Amber**: Pending / In Queue
  * 🔵 **Cyan**: Active / Running Process
  * 🟢 **Green**: Successful Run Completion
  * 🔴 **Red**: Critical Encounter / Process Failed

---

## 🚀 Native Distribution Installation

`casca` is package-agnostic and built with a neutral `noarch` structure. Choose the native installation workflow matching your target distribution framework.

### 🦅 Arch Linux

To compile and register the utility through the AUR `PKGBUILD` mapping:

1. Navigate to the local repository directory containing your build configurations.
2. Synchronize remote hashes and compile the binary locally:
   ```bash
   updpkgsums
   makepkg -sri
3. Generate the absolute tracking payload manifest prior to committing changes upstream:
    ```bash
    makepkg --printsrcinfo > .SRCINFO
    ```

### 🎩 Fedora (`.rpm`)

To install the native, architecture-independent RPM binary file:

1. Download the release package: [casca-1.0.2-1.fc44.noarch.rpm](https://github.com/deeptadeeproy/casca_script/releases/download/v1.0.2-noarch/casca-1.0.2-1.fc44.noarch.rpm)
2. Install via `dnf` to guarantee modern system dependency handling:
    ```bash
    sudo dnf install ./casca-1.0.2-1.fc44.noarch.rpm
    ```



    *Note: If you need to purge the development requirements used during compilation, safely sweep them by running:*

    ```bash
    sudo dnf remove python3-devel --autoremove
    ```

### 📦 Ubuntu / Debian (`.deb`)

To install via the native Debian binary package architecture:

1. Download the release package: [casca_1.0.2_all.deb](https://github.com/deeptadeeproy/casca_script/releases/download/v1.0.2-noarch/casca_1.0.2_all.deb)
2. Deploy the tool using `apt` to ensure clean upstream repository dependency resolution:
    ```bash
    sudo apt install ./casca_1.0.2_all.deb
    ```



*⚠️ Avoid using raw `dpkg -i`, as low-level dpkg calls cannot query external repositories to automatically download missing core requirements like `python3`.*

---

## 🛠️ Architecture Notes

### Sudo Safety & Snap/Flatpak Interactivity

`casca` is structured around non-interactive, fail-fast operations to ensure it doesn't hang indefinitely behind hidden prompts in a background frame thread. When updating sandboxed layers like Flatpak or Snap, the tool automatically routes execution hooks correctly through root validation channels while keeping tracking locks completely contained inside the concurrent UI loop.

## 📄 License

This project is open-source software licensed under the **MIT License**. See the `LICENSE` file for full compliance details.