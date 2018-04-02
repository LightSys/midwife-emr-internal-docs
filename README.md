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

## TODO

- Add additional documentation topics.
- Upgrade to the latest version of Elm.

## License

Copyright (C) 2017-2018 LightSys Technology Services, Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

See the file named AGPLv3.txt for license details.
