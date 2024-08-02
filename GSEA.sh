#!/bin/bash
#
#SBATCH --job-name=macs
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --output=pipeline_out/gsea-%A_%a.out
#SBATCH --array=0-3

GSEA_folder=/wistar/sarma/Jimmy/Bioinformatics_tools/GSEA_4.3.3/
res=${GSEA_folder}/example_GSEA/P53_collapsed_symbols.gct
cls=${GSEA_folder}/example_GSEA/P53.cls
gmax=${GSEA_folder}/human_gene_set/h.all.v2023.2.Hs.symbols.gmt
#Name the folder as you wish
out_directory=/wistar/sarma/Jimmy/Name_folder

module load Java/11.0.16

bash ${GSEA_folder}/gsea-cli.sh GSEA -res ${res} -cls ${cls} -gmx ${gmax} -out ${out_directory} 
