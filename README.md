# Fedora Silverblue (BirdieTX) &nbsp; [![bluebuild build badge](https://github.com/birdietx/silverblue/actions/workflows/build.yml/badge.svg)](https://github.com/birdietx/silverblue/actions/workflows/build.yml)

If you want to build a custom Fedora Silverblue image, you should read documentation from the [Fedora Atomic Desktops User Guide](https://docs.stg.fedoraproject.org/en-US/atomic-desktops/), [Universal Blue](https://universal-blue.org/), and [Blue Build](https://blue-build.org/). This image is subject to changes for the needs of end users and the maintainer at any given moment, and stability is not guaranteed.

## Installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/birdietx/silverblue:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/birdietx/silverblue:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/how-to/generate-iso/#_top). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/birdietx/silverblue
```
