#!/bin/bash

checkroot() {
    if (($EUID != 0)); then
        echo "Please run this script as root user
Example: sudo bash install-qemu.sh"
        exit
    fi
}

install() {
    sudo gpasswd -a $USER kvm
    sudo touch /etc/modules-load.d/kvm.conf.test
    sudo bash -c "echo 'kvm_intel' > /etc/modules-load.d/kvm.conf.test"
    sudo modprobe kvm_intel
    sudo pacman -S qemu virt-manager dnsmasq iptables ebtables dnsmasq
}

start_service() {
    sudo systemctl start libvirtd
    sudo systemctl enable libvirtd

}
checkroot
install
start_service

bash -c "cat >> 50-libvirt.rules <<EOL
/* Allow users in kvm group to manage the libvirt
daemon without authentication */
polkit.addRule(function(action, subject) {
    if (action.id == "org.libvirt.unix.manage" &&
        subject.isInGroup("kvm")) {
            return polkit.Result.YES;
    }
});
EOL"

sudo mv 50-libvirt.rules /etc/polkit-1/rules.d/50-libvirt.rules

groupadd libvirt
sudo gpasswd -a $USER libvirt
sudo virsh net-start default

echo "Finished install Qemu/KVM"
