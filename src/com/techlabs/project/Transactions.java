package com.techlabs.project;

import java.math.BigDecimal;
import java.sql.Date;

public class Transactions {
    private int id;
    private int customerId;
    private Date transactionDate;
    private BigDecimal amount;
    private String description;
    private String formattedDate; // Ensure this field exists

    // Constructor
    public Transactions(int id, int customerId, Date transactionDate, BigDecimal amount, String description) {
        this.id = id;
        this.customerId = customerId;
        this.transactionDate = transactionDate;
        this.amount = amount;
        this.description = description;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFormattedDate() {
        return formattedDate;
    }

    public void setFormattedDate(String formattedDate) {
        this.formattedDate = formattedDate;
    }
}
