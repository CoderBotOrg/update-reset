## Sample Update

This boilerplate provides 2 install scripts:

- `05_dpkg.sh` installs every deb file in `files/deb`
- `10_install_root.sh` copies everything in `files/install` to root, mantaining permissions and owners. E.g. `files/install/home/pi/a.txt` overwrites (or creates) the `/home/pi/a.txt` file on the system applying the update.

### Create the package

Assuming you have the backend and the frontend cloned alongside the update-reset folder and already run npm install on the vue app:

Prepare the payload with:

```bash
./prepare
```

(It will build and sign the package with: `create_update sample_update sample_update GPG-PRIVATE-KEY`)

`sample_update.tar` will be produced.
