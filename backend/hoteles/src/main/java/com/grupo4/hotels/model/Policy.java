package com.grupo4.hotels.model;

import javax.persistence.*;

@Entity
@Table(name = "policies")
public class Policy {


    @javax.persistence.Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_policy")
    private Integer Id;

    private String house_rules;
    private String security;
    private String cancellation_policy;

    @ManyToOne
    @JoinColumn(name = "id_product")
    private Product product;

    public Policy() {
    }

    public Policy(Integer id, String house_rules, String security, String cancellation_policy) {
        Id = id;
        this.house_rules = house_rules;
        this.security = security;
        this.cancellation_policy = cancellation_policy;
    }

    public Policy(String house_rules, String security, String cancellation_policy) {
        this.house_rules = house_rules;
        this.security = security;
        this.cancellation_policy = cancellation_policy;
    }

    public Policy(String house_rules, String security, String cancellation_policy, Product product) {
        this.house_rules = house_rules;
        this.security = security;
        this.cancellation_policy = cancellation_policy;
        this.product = product;
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public String getHouse_rules() {
        return house_rules;
    }

    public void setHouse_rules(String house_rules) {
        this.house_rules = house_rules;
    }

    public String getSecurity() {
        return security;
    }

    public void setSecurity(String security) {
        this.security = security;
    }

    public String getCancellation_policy() {
        return cancellation_policy;
    }

    public void setCancellation_policy(String cancellation_policy) {
        this.cancellation_policy = cancellation_policy;
    }
}
