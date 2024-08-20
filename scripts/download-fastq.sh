#!/bin/bash

# Set Some useful Settings to handle errors 
set -euo pipefail 

# Define URLs and file paths 


FASTQ_R1="subset-SRR11518889_1.fastq.gz"
FASTQ_R2="subset-SRR11518889_2.fastq.gz"
FASTQ_URL="https://raw.githubusercontent.com/AlexsLemonade/reproducible-research/main/instructor_notes/fastq_subset"


DATA_DIR="..data/raw/fastq/SRP255855"
mkdir -p $DATA_DIR



###### Process the R1 file #########
echo "Downloading the R1 file"


#Download the R1 file 
#-O: keep same file name as on internet
#-s: don't print status bar or errors
#-S: but actually I do want to print errors
curl -sSO ${FASTQ_URL}/${FASTQ_R1}

#Move the file 
mv ${FASTQ_R1} ${DATA_DIR}/

echo "The R1 file has this many lines:"

#Print the number of lines in the file 
gunzip -c ${DATA_DIR}/${FASTQ_R1} | wc -l


###### Process the R2 file ##########

#Download the R2 file 

echo "Downloading the R2 file"

curl -sSO ${FASTQ_URL}/${FASTQ_R2}


#Move the file 
mv ${FASTQ_R2} ${DATA_DIR}

echo "The R2 file has this many lines:"

#Print the number of lines in the file 
gunzip -c ${DATA_DIR}/${FASTQ_R2} | wc -l


