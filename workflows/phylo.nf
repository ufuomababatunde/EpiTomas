// enable dsl2
nextflow.enable.dsl=2


// import modules
include {prokka} from '../modules/prokka.nf'
include {roary} from '../modules/roary.nf'
include {iqtree} from '../modules/iqtree.nf'

workflow PHYLO {
	take:
		ch_snippy
	main:
		prokka(ch_snippy)
		roary(prokka.out.prokka_out.collect())
		iqtree(roary.out.roary_out)


}