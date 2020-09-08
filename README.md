# Description
This image is yet another dockerized version of the dnsdist (https://www.dnsdist.org/index.html)

It uses a standard user instead of root (username 'dnsdist', uid 1000)

# Usage
To use this image, a configuration file has to be set up. As this image uses a standard user, the default DNS port cannot be used as it.

```docker run -it --rm --mount type=bind,source=/here/dnsdist.conf,destination=/etc/dnsdist/dnsdist.conf -p 53:5353 -p 53:5353/udp ybovard/dnsdist:latest ```

It is also possible to change the configuration file with:
```docker run -it --rm --mount type=bind,source=/here/dnsdist.conf,destination=/etc/dnsdist/dnsdist.conf -p 53:5353 -p 53:5353/udp ybovard/dnsdist:latest  -c /my/new/file.conf```
