#!/bin/sh

# set -o errexit
# set -o nounset
mkdir -p build/python
pip3 install -t ./build/python prometheus-client
cp -R asserts_pylambda ./build/python
cp asserts_wrapper.py ./build/python
cd build
zip -r ../asserts-aws-lambda-layer-py-${VERSION}.zip ./python
cd ..
chmod 755 asserts-wrapper
zip -g asserts-aws-lambda-layer-py-${VERSION}.zip asserts-wrapper
rm -fR build
