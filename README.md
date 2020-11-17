OS-KFS





`` Code that run throughout this test
sudo bash 1_prepare.sh
git clone https://github.com/hangsiaongithub/os-kfs
cd os-kfs
bash 2_setup_env.sh
bash 3_kfs_build_stage1.sh
exit
sudo bash 4_setup_chroot.sh
sudo bash 5_enter_chroot.sh
cd os-kfs
bash 7_kfs_build_stage2.sh 