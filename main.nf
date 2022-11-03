#!/usr/bin/env nextflow

params.timeout = 10 // In milliseconds

process sleepAndRead {
    println "Sleeping for ${param.timeout} ms..."
    sleep params.timeout

    println "Reading dataset..."
	samplesCsv = file(params.samples)
	samples = Channel.fromPath(samplesCsv).splitCsv(header: true, strip: true)
	samples.dump(tag: 'samples')
}

workflow {

    sleepAndRead()


}
