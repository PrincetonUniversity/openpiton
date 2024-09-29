
echo "Patching Ariane submodule..."
cd $ARIANE_ROOT
git apply $DV_ROOT/design/chip/tile/ariane_patch/ariane.patch
