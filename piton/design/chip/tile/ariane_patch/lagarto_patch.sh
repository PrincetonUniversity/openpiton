
echo "Patching Lagarto submodule..."
cd $LAGARTO_ROOT/modules/drac-inorder
git apply $DV_ROOT/design/chip/tile/ariane_patch/lagarto.patch
