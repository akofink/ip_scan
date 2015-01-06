# ip_scan

Scan for routes to hosts in a range of ip addresses consecutively between the start and end addresses specified.

## Usage

```sh
$ ip_scan -s192.168.1.1 -e192.168.2.4                                                                                                               [0:10:50]
Scanning addresses from 192.168.1.1 to 192.168.2.4.
Valid addresses
192.168.1.2
192.168.1.1
192.168.1.6
192.168.1.5
192.168.1.7
192.168.1.8
192.168.1.4
192.168.1.255
192.168.2.1
192.168.2.3
```

## Installation

Place the source somewhere safe. The installation and executables use this repository.

```sh
cd <somewhere safe> # /usr/local/lib is a good place
git clone http://github.com/akofink/ip_scan.git
cd ip_scan
./install.rb
```

## Contributing

Feel free to add issues and pull requests.
