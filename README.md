# Midwife-EMR Internal Documentation

elm-make src/elm/Main.elm --output=build/main.js

## getInfo.json

The application expects to be able to retrieve a file named `getInfo.json`
from the root of the server. This needs to be in JSON format with two fields,
eth0 and wlan0. For example:

```
{"eth0":"192.168.20.205","wlan0":"192.168.222.1"}
```

It is assumed that the contents of this file are populated as necessary by
another process and that it accurately reflects the IP addresses in which the
Midwife-EMR application can be found at port 443.


