# OpenPiton + Arian Simulation guide

make sure that `riscv64-unknown-elf-gcc` uninstall properly

![image](https://user-images.githubusercontent.com/81433387/187080350-7b4cba08-0e42-4c1d-a3fe-27eb20181e72.png)

Then Clone riscv-toolchain in /home/$USER. 
```
git clone --recursive https://github.com/riscv/riscv-gnu-toolchain
```

If you already have then run below commands without any sudo permission. also create a directory /home/$USER/tools/riscv_install

```
cd /home/$USER
cd riscv-gnu-toolchain
./configure --prefix=/home/$USER/tools/riscv_install
make
```
