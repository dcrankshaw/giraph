#!/usr/bin/env bash

  # -eif org.apache.giraph.io.formats.LongDefaultIntTextEdgeInputFormat \


tc=/usr/bin/time


numtrial=10
cc_command="hadoop jar \
  /usr/local/giraph/giraph-examples/target/giraph-examples-1.1.0-SNAPSHOT-for-hadoop-0.20.203.0-jar-with-dependencies.jar \
  org.apache.giraph.GiraphRunner org.apache.giraph.examples.ConnectedComponentsComputation \
  -eif org.apache.giraph.io.formats.IntNullTextEdgeInputFormat \
  -eip /soc-LiveJournal1_clean.txt \
  -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat \
  -op /cc_del \
  -w 64"

pr_command="hadoop jar \
  /usr/local/giraph/giraph-examples/target/giraph-examples-1.1.0-SNAPSHOT-for-hadoop-0.20.203.0-jar-with-dependencies.jar \
  org.apache.giraph.GiraphRunner org.apache.giraph.examples.SimplePageRankComputation \
  -eif org.apache.giraph.io.formats.LongDefaultFloatTextEdgeInputFormat \
  -eip /soc-LiveJournal1_clean.txt \
  -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat \
  -op /pr_del \
  -w 64 \
  -mc org.apache.giraph.examples.SimplePageRankComputation\$SimplePageRankMasterCompute"

giraph_output=~/giraph_output_16

counter=0  
for run in {1..$numtrial}
do
  echo $counter
  $tc -f "TOTAL: %e seconds" $pr_command 2>&1 | tee -a $giraph_output/pr_runs.txt
  # -w 64 \
  # -mc "org.apache.giraph.examples.SimplePageRankComputation\$SimplePageRankMasterCompute"

  hadoop dfs -rmr /pr_del
  # echo "" >> $file
  counter=$(( $counter + 1 ))
  sleep 60
done


counter=0  
for run in {1..$numtrial}
do
  echo $counter
  $tc -f "TOTAL: %e seconds" $cc_command 2>&1 | tee -a $giraph_output/cc_runs.txt

  hadoop dfs -rmr /cc_del
  # echo "" >> $file
  counter=$(( $counter + 1 ))
  sleep 60
done
