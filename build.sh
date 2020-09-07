#!/bin/bash

echo "creating conda env:"
make create-environment

echo "Installing the package:"
make install
