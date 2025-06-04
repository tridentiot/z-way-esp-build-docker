# Z-Way ESP Build Docker

Docker for compiling Z-Way for ESP

## Fetch the docker image

```
docker pull ghcr.io/tridentiot/z-way-esp-build-docker:main
```

## Compile Z-Way for ESP

Start the container:

```
docker run -it -v $PWD:/build --platform linux/amd64 z-way-esp-build-docker bash
```

Execute inside:
```
[ -d z-way-esp32 ] || (wget https://github.com/tridentiot/z-way-builds/releases/download/nighly/z-way-esp.tgz -qO - | tar -zxf - && unzip z-way-esp32-src.zip)
cd z-way-esp32
python3 py_scripts/esp_builder.py build -s ./ -o ./bin_arch -d prod-xiao -q
```

Remove `-d prod-xiao` to build all targets.
