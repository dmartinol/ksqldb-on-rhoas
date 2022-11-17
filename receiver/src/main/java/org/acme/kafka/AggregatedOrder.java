package org.acme.kafka;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AggregatedOrder {
    @JsonProperty("CUSTOMERS_CUSTOMERID")
    public String customerId;
    @JsonProperty("NOOFITEMS")
    public long noOfItems;
    @JsonProperty("TOTALPRICE")
    public double totalPrice;

    public AggregatedOrder() {
    }

    public AggregatedOrder(String customerId, long noOfItems, double totalPrice) {
        this.customerId = customerId;
        this.noOfItems = noOfItems;
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("AggregatedOrder{");
        sb.append("customerId='").append(customerId).append('\'');
        sb.append(", noOfItems=").append(noOfItems);
        sb.append(", totalPrice=").append(totalPrice);
        sb.append('}');
        return sb.toString();
    }
}
