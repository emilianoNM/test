#!/bin/bash
# Simple script to ensure specific virtual machines stay running
VMS=("vm1" "vm2" "vm3")

for VM in "${VMS[@]}"; do
    if ! virsh domstate "$VM" | grep -q "running"; then
        echo "$(date): $VM no esta corriendo. Iniciando..." >> /var/log/vm_watch.log
        virsh start "$VM"
    fi
done
