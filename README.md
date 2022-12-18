# cert-gen

[![Build Status](https://travis-ci.org/devilbox/cert-gen.svg?branch=master)](https://travis-ci.org/devilbox/cert-gen)
[![Discord](https://img.shields.io/discord/1051541389256704091?color=8c9eff&label=Discord&logo=discord)](https://discord.gg/2wP3V6kBj4)
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
            43:4a:c5:d2:87:cc:df:bd:f3:85:c7:9c:76:2e:52:d6:06:64:a5:83
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: C = DE, ST = Berlin, L = Berlin, O = Devilbox, OU = Devilbox, CN = devilbox.org, emailAddress = ca@devilbox.org, dnQualifier = "1R15BhvvsVfYNh+QeB/77jYmCQE="
        Validity
            Not Before: Nov 30 20:48:19 2019 GMT
            Not After : Nov 27 20:48:19 2029 GMT
        Subject: C = DE, ST = Berlin, L = Berlin, O = Devilbox, OU = Devilbox, CN = devilbox.org, emailAddress = ca@devilbox.org, dnQualifier = "1R15BhvvsVfYNh+QeB/77jYmCQE="
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                RSA Public-Key: (2048 bit)
                Modulus:
                    00:9a:ec:70:20:32:85:db:a9:cc:b7:87:08:f8:10:
                    f8:2f:57:4d:3d:ca:f3:97:1a:b6:a2:20:9f:d8:a3:
                    8b:15:4e:6e:92:5e:28:d6:c7:8b:de:da:9c:98:2f:
                    23:c8:4e:ae:be:58:ec:14:a5:0d:76:4f:2c:bb:e2:
                    22:93:d7:0e:d9:d4:5d:54:25:93:65:11:d7:fd:59:
                    63:95:a5:85:98:da:20:4f:bc:d3:aa:d2:ca:d8:e6:
                    19:de:9e:ca:da:a0:4f:b6:2d:93:6e:81:c0:b9:34:
                    06:25:fd:62:75:83:96:42:12:46:93:53:01:04:17:
                    53:18:e3:81:5e:26:20:3d:85:6d:a4:8b:93:ed:9e:
                    2a:47:21:6e:54:5b:0c:11:de:a5:fd:eb:d6:37:d9:
                    b0:49:72:8d:97:68:53:ef:27:69:78:b5:05:75:8a:
                    8c:ad:a5:a1:e4:ab:04:88:42:b4:a4:d7:a8:91:99:
                    e3:f5:32:85:55:df:ec:1f:86:83:03:0e:5b:21:16:
                    17:bd:c7:71:7c:a3:8f:4b:e3:8d:ad:cc:0c:d9:6a:
                    93:1e:3a:2c:4f:ee:1e:07:90:d3:46:f4:58:2a:f9:
                    d0:41:68:c4:1d:30:2b:ab:3e:f4:4f:55:ba:37:0c:
                    6f:1e:9c:30:d8:81:7e:a1:4e:bc:ae:8a:b2:e7:53:
                    a3:ad
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Basic Constraints: critical
                CA:TRUE
            X509v3 Subject Key Identifier:
                D5:1D:79:06:1B:EF:B1:57:D8:36:1F:90:78:1F:FB:EE:36:26:09:01
            X509v3 Key Usage: critical
                Digital Signature, Certificate Sign, CRL Sign
            X509v3 Authority Key Identifier:
                keyid:D5:1D:79:06:1B:EF:B1:57:D8:36:1F:90:78:1F:FB:EE:36:26:09:01
                DirName:/C=DE/ST=Berlin/L=Berlin/O=Devilbox/OU=Devilbox/CN=devilbox.org/emailAddress=ca@devilbox.org/dnQualifier=1R15BhvvsVfYNh+QeB/77jYmCQE=
                serial:43:4A:C5:D2:87:CC:DF:BD:F3:85:C7:9C:76:2E:52:D6:06:64:A5:83

    Signature Algorithm: sha256WithRSAEncryption
         7b:6f:4c:56:ae:ef:76:f2:22:69:92:11:09:dd:67:85:5c:61:
         a7:cb:3a:0b:6e:af:38:e5:72:33:c1:90:ae:31:2d:e6:74:93:
         d3:7d:1e:e0:39:8d:d9:71:4a:bf:04:ba:07:37:99:92:ed:db:
         cc:17:fc:f2:04:de:8b:ae:d1:2c:bc:84:fc:7a:c7:95:0a:4f:
         44:00:88:11:2f:ce:b0:a8:c2:18:2c:86:5a:26:6d:a5:5e:fd:
         41:33:52:c1:12:87:26:d2:9b:d4:87:70:58:d0:22:25:f1:47:
         42:57:ca:68:b7:93:3e:0b:ee:9e:e7:24:36:de:a6:5c:eb:cf:
         cb:a2:db:5d:d0:d4:35:b3:48:18:f2:96:8b:10:60:af:b8:5d:
         22:ef:19:ed:a7:c9:7e:f5:b9:f8:ca:27:9a:f6:11:bf:b3:36:
         12:35:99:f0:39:dd:5a:d2:f2:d6:48:b2:bf:59:8c:3d:ea:a2:
         cf:56:7c:84:95:1c:1c:51:36:4c:5c:1a:d3:20:ed:5c:18:f7:
         e5:4a:66:b7:5c:0d:a1:07:a6:d8:7f:4c:5a:b5:c2:fe:3d:d6:
         49:fb:a6:3d:ed:e3:bc:47:3b:22:43:e8:91:31:dd:cd:9b:c2:
         ad:d8:6b:01:ed:67:0f:c4:c0:c6:07:40:8b:50:a2:69:18:05:
         3e:3e:85:09
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
  -i ips      Comma separated list of alt ip addresses (subjectAltName)
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
            7a:70:c7:1f:31:f2:8c:69:03:5d:6e:5a:d6:5d:44:97:47:e1:b9:58
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: C = DE, ST = Berlin, L = Berlin, O = Devilbox, OU = Devilbox, CN = devilbox.org, emailAddress = ca@devilbox.org, dnQualifier = "1R15BhvvsVfYNh+QeB/77jYmCQE="
        Validity
            Not Before: Nov 30 20:50:11 2019 GMT
            Not After : Mar  4 20:50:11 2022 GMT
        Subject: C = DE, ST = Berlin, L = Berlin, O = Devilbox, OU = Devilbox, CN = project.loc, emailAddress = admin@project.loc
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                RSA Public-Key: (2048 bit)
                Modulus:
                    00:ab:a7:0b:41:cd:5a:00:66:6f:94:15:3b:e5:f1:
                    18:84:38:48:3e:6b:7f:0a:c3:4e:51:58:0b:c9:f5:
                    85:86:ff:61:69:ea:b8:11:5a:b9:9f:97:c5:22:2a:
                    d1:f6:91:21:6e:01:ab:46:01:8c:4b:80:ba:74:a7:
                    ce:5f:5b:a1:ac:a3:e6:0f:ce:19:1c:ae:68:a3:60:
                    f9:f9:82:c1:ea:d3:eb:e5:84:1d:0c:9c:4d:94:82:
                    d2:ef:3d:89:ab:0e:15:01:c3:22:8e:cd:7a:49:ae:
                    37:9c:39:9d:40:d1:19:8d:13:3a:a6:36:e4:71:1a:
                    8a:10:b3:ca:b1:b2:a0:a0:e5:5d:ff:39:f9:7b:70:
                    85:01:bd:8f:3b:ce:92:ae:c9:6d:9c:f9:6f:99:5a:
                    e9:da:bb:28:95:01:9c:40:92:23:f0:1f:68:a3:a7:
                    d5:fc:ac:44:9a:95:63:bd:5b:6e:bd:c2:19:0e:56:
                    ab:47:40:57:90:74:d9:25:2e:75:b1:98:b1:82:8e:
                    f7:4c:b2:42:fb:a5:3c:71:14:8d:55:da:a3:00:8a:
                    85:ce:45:91:15:8c:35:86:3f:eb:9f:d7:68:15:bf:
                    24:e7:96:49:90:d4:69:71:20:89:c0:c0:c2:cd:63:
                    d0:66:38:1e:f6:60:d3:24:64:63:36:c0:19:51:23:
                    23:ad
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Basic Constraints: critical
                CA:FALSE
            X509v3 Subject Key Identifier:
                64:AE:B5:56:82:FE:E8:92:BF:9C:E0:F4:27:3D:20:79:21:CA:B4:5D
            X509v3 Key Usage: critical
                Digital Signature, Key Encipherment
            X509v3 Authority Key Identifier:
                keyid:D5:1D:79:06:1B:EF:B1:57:D8:36:1F:90:78:1F:FB:EE:36:26:09:01
                DirName:/C=DE/ST=Berlin/L=Berlin/O=Devilbox/OU=Devilbox/CN=devilbox.org/emailAddress=ca@devilbox.org/dnQualifier=1R15BhvvsVfYNh+QeB/77jYmCQE=
                serial:43:4A:C5:D2:87:CC:DF:BD:F3:85:C7:9C:76:2E:52:D6:06:64:A5:83

            X509v3 Extended Key Usage:
                TLS Web Server Authentication, TLS Web Client Authentication
            X509v3 Subject Alternative Name:
                DNS:project.loc, DNS:*.project.loc, DNS:*.www.project.loc
    Signature Algorithm: sha256WithRSAEncryption
         02:73:0d:df:49:da:d0:19:35:c2:fb:1d:99:81:aa:3a:48:51:
         1e:2e:f4:de:50:73:71:17:0c:6d:83:9e:b1:2c:1d:b5:58:c9:
         db:f0:a9:9c:db:dc:42:29:37:be:5b:59:4a:04:92:3e:da:5f:
         10:97:ff:6e:d3:23:a1:6a:6f:c9:3f:b5:61:87:6b:a7:e8:ab:
         72:a2:6e:eb:12:e9:89:71:b8:de:7c:63:62:e0:8e:9a:82:b1:
         ae:96:67:8a:20:63:2b:75:18:1a:04:36:ed:1e:8c:b5:16:d2:
         d4:77:05:5b:54:ee:d8:c4:25:6d:fb:02:2c:dc:e0:dc:2d:37:
         99:71:66:f8:06:24:ff:69:69:50:b1:10:f2:c5:ff:96:28:75:
         8a:e3:78:3c:7c:38:a9:1c:20:3e:1f:f5:dc:d3:ec:3b:ae:ac:
         f4:14:45:16:aa:3f:db:eb:ae:b8:1d:0d:4a:76:cb:02:eb:c1:
         00:e2:42:60:90:18:82:8e:3d:01:6b:1f:78:de:d9:a4:7a:df:
         71:1e:aa:7e:7b:87:2c:af:ce:47:5d:be:1f:6a:4c:cd:10:67:
         4e:41:c8:ca:90:fe:ac:2d:a1:92:e5:34:ea:da:ed:d9:9e:2d:
         ac:38:81:7d:13:5b:0f:cd:e8:a7:99:a0:1f:54:29:10:64:19:
         b6:1a:14:ab
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

**[MIT License](LICENSE.md)**

Copyright (c) 2018 [cytopia](https://github.com/cytopia)
