#!/bin/bash
eval $(keychain --eval --agents ssh -Q --quiet id_rsa id_ecdsa)
