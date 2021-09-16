# installer script
rm -rf build
rm -rf dist
git submodule update --init --recursive
pip uninstall -y CMGDB &> /dev/null || true
pip install . --upgrade --no-deps --force-reinstall --no-cache-dir $@
