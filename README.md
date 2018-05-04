# cert-gen

[![Build Status](https://travis-ci.org/devilbox/cert-gen.svg?branch=master)](https://travis-ci.org/devilbox/cert-gen)
[![Join the chat at https://gitter.im/devilbox/Lobby](https://badges.gitter.im/devilbox/Lobby.svg)](https://gitter.im/devilbox/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
![Tag](https://img.shields.io/github/tag/devilbox/cert-gen.svg)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Easily create your own CA and self-signed certificates.

The generated CA can be imported into Chrome, Firefox or Internet Explorer for local development.
All subsequent created certificates will then be valid SSL certificates to each browser.

<img width="200" style="width:200px;" src="img/address-bar.png" />

**Table of Contents**

1. [Available Tools](#available-tools)
    1. [Tools](#tools)
    2. [Requirements](#requirements)
    3. [Installation](#installation)
2. [Create Certificate Authoriy](#create-certificate-authority)
    1. [Usage: ca-gen](#usage-ca-gen)
    2. [Execute: ca-gen](#execute-ca-gen)
    3. [Example: CA](#example-ca)
3. [Create SSL Certificate](#create-ssl-certificate)
    1. [Usage: cert-gen](#usage-cert-gen)
    2. [Execute: cert-gen](#execute-cert-gen)
    3. [Example: SSL certificate](#example-ssl-certificate)
4. [Import CA into Chrome](#import-ca-into-chrome)
5. [License](#license)

----

## Available Tools

#### Tools

| Tools                    | Description |
|--------------------------|-------------|
| [ca-gen](bin/ca-gen)     | Creates a certificate authority |
| [cert-gen](bin/cert-gen) | Creates SSL certificates signed by a certificate authority |

#### Requirements

* `openssl`
* `bash`

#### Installation
```bash
$ sudo make install
```


## Create Certificate Authority

#### Usage: ca-gen
The following shows the general usage for `ca-gen`:
```bash
USAGE: ca-gen -n CN [-kdcslouev] <keyfile> <crtfile>
       ca-gen --help
       ca-gen --version

Required arguments
  -n CN       Common Name

Optional arguments
  -k int      Key size in bits
  -d int      Validity in days
  -c C        Subject two letter country name (C)
  -s ST       Subject state name (ST)
  -l L        Subject location (L)
  -o O        Subject organization (O)
  -u OU       Subject organizational unit (OU)
  -e Email    Subject email (emailAddress)
  -v          Verbose output

Required parameter
  <keyfile>   Path to output key file
  <crtfile>   Path to output cert file
```

#### Execute: ca-gen
The following command shows how the CA is generated for the [Devilbox](https://github.com/cytopia/devilbox):
```bash
$ ca-gen -v -c DE -s Berlin -l Berlin -o Devilbox -u Devilbox -n devilbox.org \
       -e ca@devilbox.org devilbox-rootCA.key devilbox-rootCA.crt
```

#### Example: CA
```bash
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            e3:a1:c0:ad:66:e3:9f:ae
    Signature Algorithm: sha256WithRSAEncryption
        Issuer: C = DE, ST = Berlin, L = Berlin, O = Devilbox, OU = Devilbox, CN = devilbox.org, emailAddress = ca@devilbox.org, dnQualifier = "1A8KSvbo+y7FW1H3dMZWUENkeec="
        Validity
            Not Before: May  1 09:22:09 2018 GMT
            Not After : Apr 28 09:22:09 2028 GMT
        Subject: C = DE, ST = Berlin, L = Berlin, O = Devilbox, OU = Devilbox, CN = devilbox.org, emailAddress = ca@devilbox.org, dnQualifier = "1A8KSvbo+y7FW1H3dMZWUENkeec="
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (2048 bit)
                Modulus:
                    00:dd:a5:c1:e1:c9:89:33:66:dc:7a:e9:42:01:32:
                    72:29:c9:bd:bf:85:96:9d:07:9b:98:79:95:23:23:
                    3a:a8:ed:fe:88:86:88:e4:51:fa:40:bc:4f:9a:d5:
                    c1:45:5f:71:ec:6c:d3:dd:35:ab:1a:7d:39:4f:04:
                    ef:ef:14:b1:c9:a1:f2:14:cf:37:ab:55:4b:ae:ad:
                    3d:32:c0:66:d5:1f:81:f0:4f:6c:28:96:c0:98:37:
                    7a:ca:86:a5:93:7a:0d:d5:b3:83:cd:22:0f:26:5a:
                    19:39:35:3a:82:ad:a6:13:de:b6:62:0a:bc:57:f2:
                    01:31:c7:3a:ce:72:02:76:e6:fc:03:9e:c1:53:63:
                    0f:ad:b3:2b:b0:fb:7e:84:c0:f9:d3:79:d9:23:a6:
                    55:d6:3a:a8:b5:d6:01:2e:18:fe:97:a8:2c:91:cd:
                    93:6e:ae:61:11:cb:57:38:9b:cc:1d:c8:41:8b:fa:
                    bc:d8:34:bb:f8:0e:57:aa:ac:d8:50:e2:46:59:88:
                    f7:7a:85:c2:08:ef:0e:35:99:66:ab:25:f6:83:4a:
                    4d:72:11:8b:eb:61:45:6c:3c:fd:09:8d:83:66:c9:
                    58:97:8a:99:27:20:b9:42:a7:d4:24:11:5e:6b:9c:
                    0f:bb:37:7b:8f:79:9a:af:d6:b9:9a:0f:9a:39:c5:
                    fa:99
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Subject Key Identifier:
                D4:0F:0A:4A:F6:E8:FB:2E:C5:5B:51:F7:74:C6:56:50:43:64:79:E7
            X509v3 Authority Key Identifier:
                keyid:D4:0F:0A:4A:F6:E8:FB:2E:C5:5B:51:F7:74:C6:56:50:43:64:79:E7

            X509v3 Basic Constraints: critical
                CA:TRUE
    Signature Algorithm: sha256WithRSAEncryption
         3b:e7:b5:0f:ca:7a:74:f9:93:c2:59:45:f9:80:b1:6b:c5:22:
         f3:93:c7:df:65:a0:f9:37:e2:d0:a6:15:56:4f:19:61:9d:e4:
         6d:b4:88:d8:8c:40:6d:e7:63:03:89:4d:06:73:6a:c5:8b:ce:
         3b:ab:f9:8f:c9:e7:fc:a6:13:88:ff:55:23:03:d5:17:e4:4c:
         38:bf:bd:6c:62:f0:16:0e:3f:d9:64:83:09:f5:38:39:9b:4c:
         64:33:c6:9c:a4:71:87:98:19:c4:44:ef:82:60:dc:13:8f:6e:
         5e:0b:a5:22:b1:2e:26:93:cf:21:db:3b:7c:e2:9d:5c:15:db:
         5f:ad:69:5b:66:f5:f0:55:75:b5:c2:ad:b4:56:77:af:4a:8d:
         64:61:c1:d9:f0:4a:04:09:61:17:98:d7:1a:c5:e7:41:4e:99:
         af:3a:86:ca:c4:63:f8:1a:55:c6:57:c1:38:40:de:7a:a8:9a:
         7a:ba:26:39:8b:cc:57:db:a1:80:ec:ec:ed:2f:7f:5f:43:41:
         b5:38:a2:3a:88:c8:f7:46:83:e2:2f:3b:64:af:24:a5:e1:af:
         4d:dd:0a:02:11:21:8b:98:db:24:36:86:b1:b3:ce:57:5e:34:
         ed:4f:0e:64:88:47:ea:f5:51:ba:a5:04:b8:b5:98:e4:4e:33:
         c1:17:0f:0e
```


## Create SSL Certificate

#### Usage: cert-gen
The following shows the general usage for cert-gen:
```bash
USAGE: cert-gen -n CN [-kdcsloueav] <ca-key> <ca-crt> <key> <csr> <crt>
       cert-gen --help
       cert-gen --version

Required arguments
  -n CN       Common Name

Optional arguments
  -k int      Key size in bits
  -d int      Validity in days
  -c C        Subject two letter country name (C)
  -s ST       Subject state name (ST)
  -l L        Subject location (L)
  -o O        Subject organization (O)
  -u OU       Subject organizational unit (OU)
  -e Email    Subject email (emailAddress)
  -a names    Comma separated list of alt names (subjectAltName)
  -v          Verbose output

Required parameter
  <ca-key>    Path to existing CA key file
  <ca-crt>    Path to existing CA crt file
  <key>       Path to output certificate key file
  <csr>       Path to output certificate csr file
  <crt>       Path to output certificate crt file
```

#### Execute: cert-gen
The following command shows how SSL certificates are generated for the [Devilbox](https://github.com/cytopia/devilbox):
```bash
$ cert-gen -v -c DE -s Berlin -l Berlin -o Devilbox -u Devilbox \
           -n project.loc -e admin@project.loc \
           -a '*.project.loc,*.www.project.loc' \
           devilbox-rootCA.key \
           devilbox-rootCA.crt \
           project.loc.key \
           project.loc.csr \
           project.loc.crt
```

#### Example: SSL Certificate
```bash
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            ea:c2:f4:1b:69:c8:66:cd
    Signature Algorithm: sha256WithRSAEncryption
        Issuer: C = DE, ST = Berlin, L = Berlin, O = Devilbox, OU = Devilbox, CN = devilbox.org, emailAddress = ca@devilbox.org, dnQualifier = "1A8KSvbo+y7FW1H3dMZWUENkeec="
        Validity
            Not Before: May  1 09:59:25 2018 GMT
            Not After : Apr 28 09:59:25 2028 GMT
        Subject: C = DE, ST = Berlin, L = Berlin, O = Devilbox, OU = Devilbox, CN = project.loc, emailAddress = admin@project.loc
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (2048 bit)
                Modulus:
                    00:d6:92:6f:27:72:a4:69:6a:5f:f8:11:5a:15:f0:
                    fd:c6:e9:8e:e7:4c:38:5e:f9:d4:d0:79:26:6b:6e:
                    c8:65:a1:2e:f1:3b:64:4e:b0:da:c4:42:02:87:70:
                    10:bb:8f:46:08:aa:48:c2:01:b1:d2:10:8c:ce:6c:
                    62:78:38:41:1a:83:4f:df:42:2e:d9:eb:7e:b1:67:
                    76:10:a4:60:b2:a4:af:dd:2d:98:24:be:48:21:fd:
                    c9:74:bc:2d:57:0f:26:15:a1:1f:cc:38:65:9f:26:
                    74:08:1d:3f:b4:96:ed:7d:1a:b9:5a:c7:5e:bf:34:
                    a8:fa:b6:c1:0b:38:e4:c7:78:3d:e3:7e:6e:a8:f5:
                    24:bf:12:1c:9d:22:c9:ab:24:50:5b:88:3f:16:ac:
                    fb:2a:b7:6e:da:1e:ec:34:56:60:ed:3c:f7:e0:08:
                    76:23:8a:54:49:11:10:29:c8:4d:ed:4b:ef:66:45:
                    7a:7d:cb:25:95:70:fd:07:2a:9b:88:a6:63:f1:b3:
                    7b:9e:82:bf:a3:81:11:84:0c:71:ee:10:bf:bc:c8:
                    6b:b2:7c:74:de:ac:ee:d8:04:3a:57:ff:aa:9e:7c:
                    b1:4e:06:26:68:e6:c2:0c:73:74:a2:72:91:7a:0d:
                    e9:80:03:e8:b1:ec:0a:fc:19:59:26:e8:2c:2f:8f:
                    de:97
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Subject Alternative Name:
                DNS:project.loc, DNS:*.project.loc, DNS:*.www.project.loc
    Signature Algorithm: sha256WithRSAEncryption
         59:4b:33:4c:99:7c:20:e1:92:ba:cb:0a:27:6f:da:be:ed:17:
         ce:cf:f5:18:95:bf:a3:fa:a2:b9:0b:43:cb:a9:90:67:ec:17:
         fe:15:96:57:90:00:e7:a3:92:c4:5d:9f:e3:06:38:75:33:7d:
         27:35:a3:91:99:3d:60:3d:85:62:86:c1:a5:77:ae:d1:bb:95:
         b0:b7:7f:74:b8:1a:f8:09:32:8c:1e:0a:6e:0d:1b:51:8b:bb:
         bd:58:78:b6:4d:89:8c:18:1c:0b:77:43:8c:9d:ee:53:3c:1f:
         ab:52:da:99:d3:87:e0:c9:0b:b8:28:29:08:de:1b:7f:69:eb:
         14:1a:fe:0d:5c:c4:ca:f0:56:ec:48:af:4a:21:38:1e:f6:23:
         7c:c8:05:d8:d8:9b:1e:f3:59:3a:a3:37:b9:ce:a8:af:5a:2d:
         72:d1:94:71:34:94:c1:fd:6f:c0:27:c4:9b:3d:59:0b:02:20:
         12:c7:35:de:c0:bd:7a:38:04:0f:41:ed:36:bd:75:27:cb:64:
         8d:0a:cf:39:29:7e:59:36:39:07:5e:70:46:9f:63:a1:33:62:
         8d:27:50:3a:62:96:b0:5b:97:c4:3e:6c:e4:5b:71:bc:92:bf:
         45:d5:31:25:eb:f2:65:17:7c:96:fe:5c:94:aa:72:f6:fd:9c:
         02:db:c7:03
```


## Import CA into Chrome

**1. Open Chrome settings - scroll down and click `Advanced`**

<img width="600" style="width:600px;" src="img/01-settings.png" />

**2. Find and click on `Manage certificates`**

<img width="600" style="width:600px;" src="img/02-advanced-settings.png" />

**3. In the tab, navigate to `AUTHORITIES`**

<img width="600" style="width:600px;" src="img/03-authorities.png" />

**4. Select `devilbox-ca.crt` from within the Devilbox git directory**

<img width="600" style="width:600px;" src="img/04-import.png" />

**5. Check all boxes**

<img width="600" style="width:600px;" src="img/05-set-trust.png" />


## License

[MIT License](LICENSE.md)
