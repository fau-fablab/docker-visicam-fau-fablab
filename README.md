# VisiCam Docker container with FAU FabLab configuration

1. build official VisiCam image first:
```sh
git clone https://github.com/t-oster/VisiCam.git
cd VisiCam
docker build . -t visicam
```
2. build this image:
```sh
git clone https://github.com/fau-fablab/docker-visicam-fau-fablab
cd docker-visicam-fau-fablab
docker build . -t visicam-fau-fablab
```
3. run this image:
```sh
docker run --rm -it --device=/dev/videoX:/dev/video0 visicam-fau-fablab
```

## License

[![Lizenz: 3.0](https://licensebuttons.net/l/by-sa/3.0/de/88x31.png)</br>CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/)
