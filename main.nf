#!/usr/bin/env nextflow

params.timeout = 10 // In milliseconds

process sleepSomeTime {
  machineType 'bar'
  /
  bash -c "echo 'Sleeping for $params.timeout milliseconds...'"
  sleep $params.timeout
  exit 0
  /
}

workflow {

    sleepSomeTime()

    println "Reading dataset..."
	samplesCsv = file(params.samples)
	samples = Channel.fromPath(samplesCsv).splitCsv(header: true, strip: true)
	samples.dump(tag: 'samples')
}
