package org.acme.kafka;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.eclipse.microprofile.reactive.messaging.Acknowledgment;
import org.eclipse.microprofile.reactive.messaging.Incoming;
import org.jboss.logging.Logger;

import javax.enterprise.context.ApplicationScoped;

/**
 * A bean consuming data from the "prices" Kafka topic and applying some
 * conversion.
 * The result is pushed to the "my-data-stream" stream which is an in-memory
 * stream.
 */
@ApplicationScoped
public class AggregatedOrderReceiver {
    private Logger log = Logger.getLogger(AggregatedOrderReceiver.class);

    @Incoming("get-aggregated-order")
    @Acknowledgment(Acknowledgment.Strategy.POST_PROCESSING)
    public void process(ConsumerRecord<String, AggregatedOrder> record) {
        record.value().customerId = record.key();
        log.infof("AggregatedOrderReceiver received %s", record.value());
    }
}
