# kafka_docker
- Dockerfile for Apache Kafka http://kafka.apache.org/>

The image is available directly from Docker Hub via 

## Tags
Currently only 2.11-1.1.0 is available.
- 2.11-1.1.0

## Pre-Requisites
 - Docker and docker-compose are installed on linux platform.
 
 - Modify below 4 environment args in docker-compose.yaml/docker-compose.single.yaml: 
 
      KAFKA_PORT: 9092
      
      KAFKA_ZOOKEEPER_CONNECT: zk1:2181,zk2:2182,zk3:2183
      
      KAFKA_BROKER_ID: 0
      
      KAFKA_LISTENERS: PLAINTEXT://:9092
 
 - Also you can customize your own kafka config env, you can add environment args in  docker-compose.yaml/docker-compose.single.yaml; Below are all of the available env args which can be customized and its default value : e.g. KAFKA_NUM_IO_THREADS is num.io.threads in kafka server.properties.
 
ENV KAFKA_BROKER_ID 0

ENV KAFKA_ZOOKEEPER_CONNECT zk

ENV KAFKA_LISTENERS PLAINTEXT://:9092

ENV KAFKA_PORT 9092

ENV KAFKA_NUM_PARTITIONS 2

ENV KAFKA_NUM_NETWORK_THREADS 5

ENV KAFKA_NUM_IO_THREADS 8

ENV KAFKA_LOG_RETENTION_HOURS 72

ENV KAFKA_LOG_DIRS /tmp/kafka-logs

ENV KAFKA_LOG_RETENTION_BYTES 10737418240

ENV KAFKA_LOG_SEGMENT_BYTES 1073741824

ENV KAFKA_LOG_FLUSH_INTERVAL_MESSAGES 10000

ENV KAFKA_LOG_FLUSH_INTERVAL_MS 1000

ENV KAFKA_DEFAULT_REPLICATION_FACTOR 2

ENV KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR 3

ENV KAFKA_TRANSACTION.STATE_LOG_REPLICATION_FACTOR 3

ENV KAFKA_TRANSACTION_STATE_LOG_MIN_ISR 3

## Usages

- Start a fault cluster in a server: docker-compose up -f docker-compose.yaml -d

- Start a cluster in different box: docker-compose up -f docker-compose.single.yaml -d

- After starting cluster, please run get-broker-list.sh <kafka-container-name> to match kafka container hostname to its container id.

## Create a topic

./kafka-topics.sh --create --zookeeper zk:2181 --replication-factor 2 --partitions 2 --topic topic1

## Produce a topic


./kafka-console-producer.sh --broker-list kafka0:9093,kafka1:9094,kafka2:9095 --topic topic1

## Consume a topic

./kafka-console-consumer.sh --broker-list kafka0:9093,kafka1:9094,kafka2:9095 --topic topic1

      
