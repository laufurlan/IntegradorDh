package com.grupo4.hotels.model.CompositeKeys;

import com.grupo4.hotels.model.Attribute;
import com.grupo4.hotels.model.Product;

import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.JoinColumn;
import java.io.Serializable;
@Embeddable
public class ProductAttributteId implements Serializable {

    @JoinColumn(name = "id_product")
    private Product product;

    @JoinColumn(name = "id_attribute")
    private Attribute attribute;

    public ProductAttributteId() {
    }

    public ProductAttributteId(Product product, Attribute attribute) {
        this.product = product;
        this.attribute = attribute;
    }
}
