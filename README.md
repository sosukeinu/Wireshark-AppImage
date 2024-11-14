[![License](https://img.shields.io/badge/License-MIT-blue)](#license "Go to license section")

## Wireshark - AppImage

![pngwing com(1)](https://user-images.githubusercontent.com/90393971/133909561-bc211f9c-3ccc-48b6-aa7a-12123f16badc.png)

1. Download pkg2appimage tool and make it executable.
   ```shell
   wget https://github.com/sagarkhandve/Wireshark/releases/download/v3.4.4/Wireshark-3.4.4_x86_64.AppImage
   chmod +x Wireshark-3.4.4_x86_64.AppImage
   ```
2. Run:

   ```shell
   sudo ./Wireshark-3.4.4_x86_64.AppImage
   ```

A configuration for [pkg2appimage](https://github.com/AppImage/pkg2appimage) to build Wireshark in AppImage form.

How to use it?

1. Clone this repository and `cd` into it.
    ```shell
    git clone https://github.com/sagarkhandve/Wireshark-AppImage.git
    cd Wireshark/
    ```
2. Download pkg2appimage tool and make it executable.
   ```shell
   wget https://github.com/AppImage/pkg2appimage/raw/master/pkg2appimage
   chmod +x pkg2appimage
   ```
3. Build it:

   ```shell
   ./pkg2appimage Wireshark.yml
   ```

4. After a short break you should get an executable inside `out/` directory.


# To build using Docker

```bash
docker build -t build-image .
```

then run the command using the build image

```bash
docker run -it --rm -v "$PWD:/data:z" build-image
```

**OR** you can convieniantly build using `make`

first, make an `.env` file to load your specific variables (usually you will not have to change these values)

```bash
cp example.env .env
```

Then, run `make`.