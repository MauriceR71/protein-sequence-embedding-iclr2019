# Visualizing Protein Sequence Embeddings

We are using the embeddings learned for an LSTM model, as described in this [paper](https://openreview.net/pdf?id=SygLehCqtm). [Code](https://github.com/tbepler/protein-sequence-embedding-iclr2019) for the model is also available.

We [downloaded](http://bergerlab-downloads.csail.mit.edu/bepler-protein-sequence-embeddings-from-structure-iclr2019/pretrained_models.tar.gz) the pretrained models, which contains the following models:

- `me_L1_100d_lstm3x512_lm_i512_mb64_tau0.5_p0.05_epoch100.sav`
- `pfam_lm_lstm2x1024_tied_mb64.sav`
- `ssa_L1_100d_lstm3x512_lm_i512_mb64_tau0.5_lambda0.1_p0.05_epoch100.sav`
- `ssa_L1_100d_lstm3x512_lm_i512_mb64_tau0.5_p0.05_epoch100.sav`
- `ua_L1_100d_lstm3x512_lm_i512_mb64_tau0.5_p0.05_epoch100.sav`

As suggested by the author, we used the following pretrained model:
`ssa_L1_100d_lstm3x512_lm_i512_mb64_tau0.5_lambda0.1_p0.05_epoch100.sav`
which we saved at the top level of the repo.

As described in the original [README](https://github.com/tbepler/protein-sequence-embedding-iclr2019/README.md), we must download all data and extract it into the `data` folder.

## Dependencies
We show how to create a virtual environment with all the required packages. Package managers like [conda](https://docs.conda.io/en/latest/) can also be used.

Navigate to the repository.
`cd /path/to/repo`

Create a virtual environment.
`python3 -m venv ~/path/to/venv`

Activate the virtual environment.
`source ~/path/to/venv/bin/activate`

Install requirements.
`pip install -r requirements.txt`

Compile cython
`python setup.py build_ext --inplace`

It looks like we don't need the big data to do what we want.

It takes a while to process the features on a laptop...it might be better to set it up on colab first. This is because we're actually running the embedding model on it!

To embed a sequence, it must be stored in the .fa  format and stored in the secstr_path.

`python eval_secstr.py \
            ssa_L1_100d_lstm3x512_lm_i512_mb64_tau0.5_lambda0.1_p0.05_epoch100.sav \
            --num-epochs 0 \ # no additional training
            --print-examples 1`
