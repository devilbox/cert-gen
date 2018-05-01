# ca-gen

Easily create your CA and self-signed certificates.

## Available Tools

* [ca-gen](bin/ca-gen)
* [cert-gen](bin/cert-gen)


## Create CA

#### Usage
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

#### Devilbox example
```bash
$ ca-gen -v -c DE -s Berlin -l Berlin -o Devilbox -u Devilbox -n devilbox.org \
       -e ca@devilbox.org devilbox-rootCA.key devilbox-rootCA.crt
```

#### Example output
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
-----BEGIN CERTIFICATE-----
MIIEPjCCAyagAwIBAgIJAOOhwK1m45+uMA0GCSqGSIb3DQEBCwUAMIGzMQswCQYD
VQQGEwJERTEPMA0GA1UECAwGQmVybGluMQ8wDQYDVQQHDAZCZXJsaW4xETAPBgNV
BAoMCERldmlsYm94MREwDwYDVQQLDAhEZXZpbGJveDEVMBMGA1UEAwwMZGV2aWxi
b3gub3JnMR4wHAYJKoZIhvcNAQkBFg9jYUBkZXZpbGJveC5vcmcxJTAjBgNVBC4T
HDFBOEtTdmJvK3k3RlcxSDNkTVpXVUVOa2VlYz0wHhcNMTgwNTAxMDkyMjA5WhcN
MjgwNDI4MDkyMjA5WjCBszELMAkGA1UEBhMCREUxDzANBgNVBAgMBkJlcmxpbjEP
MA0GA1UEBwwGQmVybGluMREwDwYDVQQKDAhEZXZpbGJveDERMA8GA1UECwwIRGV2
aWxib3gxFTATBgNVBAMMDGRldmlsYm94Lm9yZzEeMBwGCSqGSIb3DQEJARYPY2FA
ZGV2aWxib3gub3JnMSUwIwYDVQQuExwxQThLU3Zibyt5N0ZXMUgzZE1aV1VFTmtl
ZWM9MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3aXB4cmJM2bceulC
ATJyKcm9v4WWnQebmHmVIyM6qO3+iIaI5FH6QLxPmtXBRV9x7GzT3TWrGn05TwTv
7xSxyaHyFM83q1VLrq09MsBm1R+B8E9sKJbAmDd6yoalk3oN1bODzSIPJloZOTU6
gq2mE962Ygq8V/IBMcc6znICdub8A57BU2MPrbMrsPt+hMD503nZI6ZV1jqotdYB
Lhj+l6gskc2Tbq5hEctXOJvMHchBi/q82DS7+A5XqqzYUOJGWYj3eoXCCO8ONZlm
qyX2g0pNchGL62FFbDz9CY2DZslYl4qZJyC5QqfUJBFea5wPuzd7j3mar9a5mg+a
OcX6mQIDAQABo1MwUTAdBgNVHQ4EFgQU1A8KSvbo+y7FW1H3dMZWUENkeecwHwYD
VR0jBBgwFoAU1A8KSvbo+y7FW1H3dMZWUENkeecwDwYDVR0TAQH/BAUwAwEB/zAN
BgkqhkiG9w0BAQsFAAOCAQEAO+e1D8p6dPmTwllF+YCxa8Ui85PH32Wg+Tfi0KYV
Vk8ZYZ3kbbSI2IxAbedjA4lNBnNqxYvOO6v5j8nn/KYTiP9VIwPVF+RMOL+9bGLw
Fg4/2WSDCfU4OZtMZDPGnKRxh5gZxETvgmDcE49uXgulIrEuJpPPIds7fOKdXBXb
X61pW2b18FV1tcKttFZ3r0qNZGHB2fBKBAlhF5jXGsXnQU6ZrzqGysRj+BpVxlfB
OEDeeqiaeromOYvMV9uhgOzs7S9/X0NBtTiiOojI90aD4i87ZK8kpeGvTd0KAhEh
i5jbJDaGsbPOV1407U8OZIhH6vVRuqUEuLWY5E4zwRcPDg==
-----END CERTIFICATE-----
```

## License

[MIT License](LICENSE.md)
