#!/usr/bin/env nextflow

params.timeout = 10
params.exit = 0
params.cmd = "echo 'Hello (timeout $params.timeout)'"

process foo {
  machineType 'bar'
  /
  bash -c "$params.cmd"
  sleep $params.timeout
  exit $params.exit
  /
}

workflow {

    sleep 5000

	samplesCsv = file(params.samples)
	samples = Channel.fromPath(samplesCsv).splitCsv(header:true, strip:true)
	samples.dump(tag:'samples')
}
