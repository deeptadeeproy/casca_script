# Maintainer: Deeptadeep Roy <deeptadeeproy>
pkgname=casca
pkgver=1.0.0
pkgrel=1
pkgdesc="A btop-style concurrent multi-channel system updater utilizing a full-screen curses TUI dashboard."
arch=('any')
url="https://github.com/deeptadeeproy/casca_script"
license=('MIT')
depends=('python')

# Expecting the local file to be named 'casca'
source=("casca")
sha256sums=('SKIP')

package() {
    # Install your local casca file directly to /usr/bin/casca
    install -Dm755 "${srcdir}/casca" "${pkgdir}/usr/bin/casca"
}
