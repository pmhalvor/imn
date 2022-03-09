#!/bin/bash

# Job name:
#SBATCH --job-name=fgsa-dev
# Project:
#SBATCH --account=ec37
# Wall time limit: --time=DD-HH:MM:SS
#SBATCH --time=10:30:00
# Memory requested:
#SBATCH --mem-per-cpu=30G
# Run on GPU
#SBATCH --partition=accel
#SBATCH --gpus=1

## Set up job environment:
set -o errexit  # Exit the script on any error
set -o nounset  # Treat any unset variables as an error

# modules
module --quiet purge  # Reset the modules to the system default
module use -a /fp/projects01/ec30/software/easybuild/modules/all/

# set up environment
# pip install -r requirements.txt


## Do some work:
cd $HOME/nlp/msc/imn/code
python train.py --domain $domain --embdim 200 --use-domain-emb 1
