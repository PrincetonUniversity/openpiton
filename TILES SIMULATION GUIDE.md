# OpenPiton + Arian Simulation guide

make sure that `riscv64-unknown-elf-gcc` uninstall properly

```
sudo apt-get remove gcc-riscv64-unknown-elf

```
Remove it with dependencies
```
sudo apt-get -y autoremove gcc-riscv64-unknown-elf
```

![image](https://user-images.githubusercontent.com/81433387/187080350-7b4cba08-0e42-4c1d-a3fe-27eb20181e72.png)

Then Clone riscv-toolchain in /home/$USER. 
```
git clone --recursive https://github.com/riscv/riscv-gnu-toolchain
```

If you already have then run below commands without any sudo permission. also create a directory /home/$USER/tools/riscv_install

```
cd /home/$USER
cd riscv-gnu-toolchain
./configure --prefix=/home/$USER/tools/riscv_install > /dev/null
sudo bash
make
```
Cloning Openpiton repo in /home/$USER


```
git clone https://github.com/MARCore1/openpiton.git
sudo bash
bash
cd /home/$USER/MARCore1/openpiton
source piton/arian_setup.sh
source piton/arian_build_tools.sh
```
Output after completion

![image](https://user-images.githubusercontent.com/81433387/187090809-2f5b9a9b-03ca-469f-b553-9a6fd24a295d.png)

If the above output shows on your terminal then source the file
```
source openpiton/source/riscv-test.sh
```
```
sims -sys=manycore -x_tiles=1 -y_tiles=1 -vlt_build -ariane
 sims -sys=manycore -vlt_run -x_tiles=1 -y_tiles=1 rv64ui-p-addi.S -ariane -precompiled
```
![image](https://user-images.githubusercontent.com/81433387/187253966-3f2362c7-dea6-4ea5-a55b-f993c0f0e8df.png)

