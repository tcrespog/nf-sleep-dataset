#!/usr/bin/env nextflow

params.timeout = 10

workflow {

    sleep params.timeout

	samplesCsv = file(params.samples)
	samples = Channel.fromPath(samplesCsv).splitCsv(header:true, strip:true)
	samples.dump(tag:'samples')
}
