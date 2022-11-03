#!/usr/bin/env nextflow

params.timeout = 10 // In milliseconds

workflow {

    println "Sleeping for ${params.timeout} ms..."
    sleep params.timeout

    println "Reading dataset..."
	samplesCsv = file(params.samples)
	samples = Channel.fromPath(samplesCsv).splitCsv(header: true, strip: true)
	samples.dump(tag: 'samples').view()

}
