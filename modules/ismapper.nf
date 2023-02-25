params.ref_gbk = ""
params.IS_fasta = ""

process ismapper {
	container 'bactopia/tools-ismapper:1.7.1'

	tag "working on $sample"

	errorStrategy 'ignore'
	
	publishDir (
	path: "${params.out_dir}",
	mode: "copy",
	overwrite: "true"
	)

	input:
	tuple val(sample), path(fastq_1), path(fastq_2)


	output:
	path("10_ismapper/*")


	script:
	"""
	mkdir -p 10_ismapper

	ismap --reads $fastq_1 $fastq_2 --queries $params.IS_fasta --reference $params.ref_gbk --output_dir 10_ismapper
	"""
}
