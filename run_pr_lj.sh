#!/usr/bin/env bash

time hadoop jar \
  /usr/local/giraph/giraph-examples/target/giraph-examples-1.1.0-SNAPSHOT-for-hadoop-0.20.203.0-jar-with-dependencies.jar \
  org.apache.giraph.GiraphRunner org.apache.giraph.examples.SimplePageRankComputation \
  -eif org.apache.giraph.io.formats.LongDefaultFloatTextEdgeInputFormat \
  -eip /soc-LiveJournal1_clean.txt \
  -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat \
  -op /pr_del \
  -w 64 \
  -mc "org.apache.giraph.examples.SimplePageRankComputation\$SimplePageRankMasterCompute"

hadoop dfs -rmr /pr_del
