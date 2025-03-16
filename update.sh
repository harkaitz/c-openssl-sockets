#!/bin/sh -e
echo "Downloading sockets.h ..."
url="https://github.com/openssl/openssl/raw/refs/tags/openssl-3.2.4/include/internal/sockets.h"
hdr="sockets.h"

cat > .tmp <<-EOF
	#ifdef _WIN32
	#  define OPENSSL_SYS_WINDOWS
	#  include <ws2tcpip.h>
	#else
	#  define OPENSSL_SYS_UNIX
	#  include <unistd.h>
	#  define SOCKET int
	#endif
	EOF

wget -q -O "${hdr}.tmp" "${url}"
sed '
    \|<openssl/opensslconf.h>|{
        r .tmp
        d
    }
' "${hdr}.tmp" > "${hdr}"
rm -f "${hdr}.tmp" ".tmp"



