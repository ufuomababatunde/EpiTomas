process multiqc {
	container 'quay.io/biocontainers/multiqc:1.11--pyhdfd78af_0'

	tag "collecting"

	publishDir (
	path: "${params.out_dir}/11_multiQC",
	mode: "copy",
	overwrite: "true"
	)


	input:
	file(preTrim)
	file(postTrim)
	file(kraken)
	file(coverage)

	output:
	path "*"

	script:
	"""
	multiqc $preTrim $postTrim $kraken $coverage
	"""

}