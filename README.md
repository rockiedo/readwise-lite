# Readwise Lite

<a href='https://play.google.com/store/apps/details?id=com.rdev.readwise_lite'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png' width=240/></a>

## Overview

This is a minimal version of the Readwise app. It works offline and offers a convenient search function.

<img src="https://user-images.githubusercontent.com/11256533/211848966-c4dd59a8-28fb-4283-8dcb-6f48207a0831.png" width="260"/> <img src="https://user-images.githubusercontent.com/11256533/211849894-e22bfd7c-36dc-48fa-b630-6f9c9d9b1137.png" width="260"/> <img src="https://user-images.githubusercontent.com/11256533/211849949-796c72e3-08a6-4804-81c6-4987975324fd.png" width="260"/>


## Project setup

This project leverages:

- `FVM` for easy switching between Flutter versions.
- `Melos` for seamless modularisation.

Please make sure that you have them set up before building the project. The detailed instructions can be found at:

- [FVM installation](https://fvm.app/docs/getting_started/overview).
- [Getting started with Melos](https://melos.invertase.dev/getting-started).

## Build instruction

Once you have the project set up. Please follow these steps to build and run the app.

### Bootstrap the project

Bootstrap is needed when:

- Setting up the project for the first time.
- Changing the dependencies between packages in the project.

```shell
# Under the [root_project] directory
melos bootstrap
```

### Build and run the app

Before continuing, make sure you have a physical device, an Android emulator or an iOS simulator connected.

```shell
# Under the `[root_project]/app` directory.
fvm flutter devices

fvm flutter run
```

# License

Readwise Lite is available for free on Google Play Store. It is also open-source under
the [MIT](https://github.com/rockiedo/readwise-lite/blob/master/LICENSE) license.
