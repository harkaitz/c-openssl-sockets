C OPENSSL SOCKETS
=================

A standalone copy of sockets.h from OpenSSL 3.2.4 for Winsock/POSIX
compativility.

To include sockets.h simply put:

    #include "sockets.h"

Use SOCKET for sockets. In windows place the following:

    WSADATA wsaData;
    if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0) {
        errorf("WSAStartup: %d", WSAGetLastError());
        return 1;
    }

    -lws2_32
