## Sample Update

This boilerplate provides an install script:

`10_install_root.sh` copies everything in `files/install` to root, mantaining permissions and owners. E.g. `files/install/home/pi/a.txt` overwrites (or creates) the `/home/pi/a.txt` file on the system applying the update.

And a `prepare` script:

- Builds the vue-app
- Creates a manifest.json with some metadata:
  + backend commit hash at the time of the build
- Copies the backend, cleaning out logs, stub classes, virtualenv artifacts
- Copies the files in `pre`
- Signs and produces the final package, `sample_update.tar`

### Create the package

Assuming you have the backend and the frontend cloned alongside the update-reset folder and already run npm install on the vue app:

Prepare the payload with:

```bash
./prepare
```

`sample_update.tar` will be produced.

### Troubleshoot

- Check the folder structure in `install`. Remember that `[..]/update-reset/sample/sample_update/files/install/` is mapped to `/` on the Raspberry;
- Check `/var/logs/coderbot_update.log` and `/var/logs/coderbot_update_last.log` on the Raspberry for the update_coderbot script logs;
- The vue-app may be client-cached (see https://github.com/CoderBotOrg/backend/issues/108). A full refresh may be needed (CTRL+F5).
