Name:           casca
Version:        1.0.2
Release:        1%{?dist}
Summary:        A btop-style concurrent multi-channel system updater TUI dashboard

License:        MIT
URL:            https://github.com/deeptadeeproy/casca_script
# Points to the exact production tarball created by your v1.0.2-arch release tag
Source0:        https://github.com/deeptadeeproy/casca_script/archive/refs/tags/v%{version}-arch.tar.gz

BuildArch:      noarch
BuildRequires:  python3-devel
Requires:       python3

%description
Casca is an intelligent, multi-threaded, cross-distribution maintenance tool 
designed to sync, upgrade, and clean your Linux system through a single execution 
window featuring a responsive, concurrent 4-quadrant curses TUI dashboard.

%prep
# Extracted folder matching your git archive layout name style
%autosetup -n casca_script-%{version}-arch

%install
# Create the targeted /usr/bin execution path inside the build root environment
mkdir -p %{buildroot}%{_bindir}
# Install the python file natively as an executable binary mapping
install -m 0755 casca %{buildroot}%{_bindir}/casca

%files
%license LICENSE
%{_bindir}/casca

%changelog
- Bump to version 1.0.2 with privilege escalation for flatpak and snaps and sudo safety logic checks with dynamic UI views.