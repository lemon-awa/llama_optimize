#!/bin/bash
#SBATCH --job-name=LLAMA_FULL_OPENWEB_PRETRAIN
#SBATCH --mail-user=xziyang@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --account=oymak_owned1
#SBATCH --partition=spgpu2
#SBATCH --cpus-per-task=2
#SBATCH --gres=gpu:6
#SBATCH --ntasks-per-node=6
#SBATCH --mem-per-gpu=48G
#SBATCH --nodes=1
#SBATCH --time=50:00:00
#SBATCH --export=NONE
#SBATCH --output=/scratch/jiasi_root/jiasi0/xziyang/embed_log/%x-%j.log


#module load python3.9-anaconda
#pip install torch
module load cuda/12.1.1
source ~/.bashrc 
conda activate /home/xziyang/.conda/envs/opt
cd /scratch/jiasi_root/jiasi0/xziyang/llama_optimize/litgpt/finetune
srun /home/xziyang/.conda/envs/opt/bin/python full2.py
