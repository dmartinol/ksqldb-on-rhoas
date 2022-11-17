package org.acme.kafka;

import io.quarkus.kafka.client.serialization.ObjectMapperDeserializer;

public class AggregatedOrderDeserializer extends ObjectMapperDeserializer<AggregatedOrder> {
    public AggregatedOrderDeserializer() {
        super(AggregatedOrder.class);
    }
}
