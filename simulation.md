### Environment Setup
- The `PITON_ROOT` environment variable should point to the root of the OpenPiton repository

- Run source `$PITON_ROOT/piton/piton_settings.bash` to setup the environment
```
sudo apt install iverilog
export $VCS_HOME=/usr
```
### Environment dependecies
> cd ../piton/tools/bin/

```
mktools
mkplilib
mkplilib clean
mkplilib icarus
```


- source $PITON ROOT/piton/piton settings.bash
- sudo apt install csh
- sudo apt-get install libc6-i386
- sudo apt-get install libelf-dev
- sudo apt install libbit-vector-perl
- cd $PITON_ROOT/build
- sims -sys=manycore -x_tiles=1 -y_tiles=1 -icv_build
- sims -sys=manycore -x_tiles=1 -y_tiles=1 -icv_run princeton-test-test.s
