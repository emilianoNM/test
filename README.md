# simple-node-js-react-npm-app

This repository is for the
[Build a Node.js and React app with npm](https://jenkins.io/doc/tutorials/build-a-node-js-and-react-app-with-npm/)
tutorial in the [Jenkins User Documentation](https://jenkins.io/doc/).

The repository contains a simple Node.js and React application which generates
a web page with the content "Welcome to React" and is accompanied by a test to
check that the application renders satisfactorily.

The `jenkins` directory contains an example of the `Jenkinsfile` (i.e. Pipeline)
you'll be creating yourself during the tutorial and the `scripts` subdirectory
contains shell scripts with commands that are executed when Jenkins processes
the "Test" and "Deliver" stages of your Pipeline.

## VM Monitor Script

This repository also contains a small example for monitoring virtual machines on a Linux host.
The files in `vm-monitor` provide a `vm_watch.sh` script and the corresponding systemd
service and timer units.

1. Copy `vm-monitor/vm_watch.sh` to `/usr/local/bin/` and make it executable:
   ```bash
   sudo install -m 755 vm-monitor/vm_watch.sh /usr/local/bin/vm_watch.sh
   ```
2. Copy the service and timer files to `/etc/systemd/system/`:
   ```bash
   sudo cp vm-monitor/vm-watch.service /etc/systemd/system/
   sudo cp vm-monitor/vm-watch.timer /etc/systemd/system/
   ```
3. Reload systemd and enable the timer:
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl enable --now vm-watch.timer
   ```

With this setup the script checks a list of VMs every five minutes and starts any that
are found powered off.
