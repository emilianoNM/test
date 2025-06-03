#!/bin/bash
# Simple script to ensure specific virtual machines stay running
VMS=("vm1" "vm2" "vm3")

for VM in "${VMS[@]}"; do
    if ! VBoxManage showvminfo "$VM" --machinereadable | grep -q 'VMState="running"'; then
        echo "$(date): $VM no esta corriendo. Iniciando..." >> /var/log/vm_watch.log
        VBoxManage startvm "$VM" --type headless
    fi
done
