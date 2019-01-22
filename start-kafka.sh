#!/bin/bash
base_dir="/opt/kafka_2.11-1.1.0/bin"

cd $base_dir
sh kafka-server-start.sh ../config/server.properties \
   --override broker.id=$KAFKA_BROKER_ID \
   --override zookeeper.connect=$KAFKA_ZOOKEEPER_CONNECT \
   --override listeners=$KAFKA_LISTENERS \
   --override port=$KAFKA_PORT \
   --override num.network.threads=$KAFKA_NUM_NETWORK_THREADS \
   --override num.io.threads=$KAFKA_NUM_IO_THREADS \
   --override log.flush.interval.messages=$KAFKA_LOG_FLUSH_INTERVAL_MESSAGES \
   --override log.flush.interval.ms=$KAFKA_LOG_FLUSH_INTERVAL_MS \
   --override log.retention.hours=$KAFKA_LOG_RETENTION_HOURS \
   --override log.dirs=$KAFKA_LOG_DIRS \
   --override log.retention.bytes=$KAFKA_LOG_RETENTION_BYTES \
   --override log.segment.bytes=$KAFKA_LOG_SEGMENT_BYTES \
   --override num.partitions=$KAFKA_NUM_PARTITIONS \
   --override default.replication.factor=$KAFKA_DEFAULT_REPLICATION_FACTOR \
   --override offsets.topic.replication.factor=$KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR \
   --override transaction.state.log.replication.factor=$KAFKA_TRANSACTION.STATE_LOG_REPLICATION_FACTOR \
   --override transaction.state.log.min.isr=$KAFKA_TRANSACTION_STATE_LOG_MIN_ISR