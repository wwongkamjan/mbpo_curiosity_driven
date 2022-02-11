#!/bin/bash
#SBATCH --job-name=explo_mbpo_hopper                           # sets the job name
#SBATCH --output=out/explo_mbpo_hopper_out.%j                            # indicates a file to redirect STDOUT to; %j is the jobid 
#SBATCH --error=out/explo_mbpo_hopper_err_out.%j                             # indicates a file to redirect STDERR to; %j is the jobid
#SBATCH --time=48:00:00                                          # how long you think your job will take to complete; format=hh:mm:ss
#SBATCH --qos=medium                                          # set QOS, this will determine what resources can be requested
#SBATCH --mem=16GB                                              # memory required by job; if unit is not specified MB will be assumed
#SBATCH --gres=gpu:1
#SBATCH --account=furongh
#SBATCH --mail-user=wwongkam@terpmail.umd.edu
#SBATCH --mail-type=ALL
module add cuda/11.1.1
module load cudnn/v8.2.1

srun bash -c "hostname; python3 main_mbpo.py --env_name 'Hopper-v2' --num_epoch 100 --model_type 'pytorch' --exploit_min_value 0.5 --exploit_max_value 10 --save_dir 'exploration' --exp_name 'explo_hopper_2_05_10'"
# once the end of the batch script is reached your job allocation will be revoked


