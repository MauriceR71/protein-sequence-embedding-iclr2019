#!/bin/bash

# download the data
wget http://bergerlab-downloads.csail.mit.edu/bepler-protein-sequence-embeddings-from-structure-iclr2019/scope.tar.gz
wget http://bergerlab-downloads.csail.mit.edu/bepler-protein-sequence-embeddings-from-structure-iclr2019/secstr.tar.gz
wget http://bergerlab-downloads.csail.mit.edu/bepler-protein-sequence-embeddings-from-structure-iclr2019/transmembrane.tar.gz
wget http://bergerlab-downloads.csail.mit.edu/bepler-protein-sequence-embeddings-from-structure-iclr2019/casp12.tar.gz
tar -zxvf scope.tar.gz > /dev/null
tar -zxvf secstr.tar.gz > /dev/null
tar -zxvf transmembrane.tar.gz > /dev/null
tar -zxvf casp12.tar.gz > /dev/null

# download the model
cd ..
wget http://bergerlab-downloads.csail.mit.edu/bepler-protein-sequence-embeddings-from-structure-iclr2019/pretrained_models.tar.gz
tar -zxvf pretrained_models.tar.gz > /dev/null

# run the model
python eval_secstr.py ssa_L1_100d_lstm3x512_lm_i512_mb64_tau0.5_lambda0.1_p0.05_epoch100.sav --num-epochs 0 --print-examples 1

