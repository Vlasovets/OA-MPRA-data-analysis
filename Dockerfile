FROM snakemake/snakemake:v8.16.0


# MPRAsnakeflow development version
RUN <<EOR
	mkdir -p /data
	cd /data
	git clone https://github.com/kircherlab/MPRAsnakeflow.git
	cd MPRAsnakeflow
	git checkout development
EOR

# assoc_basic data
RUN <<EOR
	mkdir -p /data/work/assoc_basic/data
	cd /data/work/assoc_basic
	curl -s ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM4237nnn/GSM4237954/suppl/GSM4237954_9MPRA_elements.fa.gz | \
	zcat - |awk '{ count+=1; if (count == 1) { print } else { print substr($1,1,171)}; if (count == 2) { count=0 } }' | awk '{gsub(/[\]\[]/,"_")} $0' > design.fa

	cd data
	wget -q -O SRR10800986_1.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800986_1.200K.fastq.gz
	wget -q -O SRR10800986_2.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800986_2.200K.fastq.gz
	wget -q -O SRR10800986_3.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800986_3.200K.fastq.gz
EOR
# count_basic data
# assoc_basic data
RUN <<EOR
	mkdir -p /data/work/count_basic/data

	cp /data/MPRAsnakeflow/resources/count_basic/experiment.csv /data/work/count_basic/
	cp /data/MPRAsnakeflow/resources/count_basic/SRR10800986_barcodes_to_coords.tsv.gz /data/work/count_basic/

	cd /data/work/count_basic/data

	wget -q -O SRR10800881_1.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800881_1.200K.fastq.gz
	wget -q -O SRR10800881_2.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800881_2.200K.fastq.gz
	wget -q -O SRR10800881_3.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800881_3.200K.fastq.gz

	
	wget -q -O SRR10800882_1.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800882_1.200K.fastq.gz
	wget -q -O SRR10800882_2.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800882_2.200K.fastq.gz
	wget -q -O SRR10800882_3.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800882_3.200K.fastq.gz

	
	wget -q -O SRR10800883_1.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800883_1.200K.fastq.gz
	wget -q -O SRR10800883_2.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800883_2.200K.fastq.gz
	wget -q -O SRR10800883_3.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800883_3.200K.fastq.gz

	
	wget -q -O SRR10800884_1.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800884_1.200K.fastq.gz
	wget -q -O SRR10800884_2.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800884_2.200K.fastq.gz
	wget -q -O SRR10800884_3.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800884_3.200K.fastq.gz

	
	wget -q -O SRR10800885_1.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800885_1.200K.fastq.gz
	wget -q -O SRR10800885_2.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800885_2.200K.fastq.gz
	wget -q -O SRR10800885_3.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800885_3.200K.fastq.gz

	
	wget -q -O SRR10800886_1.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800886_1.200K.fastq.gz
	wget -q -O SRR10800886_2.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800886_2.200K.fastq.gz
	wget -q -O SRR10800886_3.fastq.gz https://kircherlab.bihealth.org/download/ali/SRR10800886_3.200K.fastq.gz
EOR

# snakemake profile

RUN <<EOR
	mkdir -p /etc/xdg/snakemake/mprasnakeflow
EOR
COPY profiles/mprasnakeflow/config.yaml /etc/xdg/snakemake/mprasnakeflow/config.yaml
ENV SNAKEMAKE_PROFILE=mprasnakeflow

# create assignment conda environments
RUN <<EOR
	RUN mkdir -p /data/conda_envs
	conda config --set channel_priority strict
	cd /data/work/assoc_basic
	snakemake --configfile /data/MPRAsnakeflow/resources/assoc_basic/config.yml \
	--quiet rules --conda-create-envs-only
EOR

# create assignment conda environments
RUN <<EOR
	RUN mkdir -p /data/conda_envs
	conda config --set channel_priority strict
	cd /data/work/count_basic
	snakemake --configfile /data/MPRAsnakeflow/resources/count_basic/config.yml \
	--quiet rules --conda-create-envs-only
EOR
