package com.techlabs.project;

import java.sql.Timestamp;

public class Transaction {
    private String accountNumber;
    private String transactionType;
    private double amount;
    private Timestamp transactionDate;
    private String receiverAccountNumber;

    public Transaction(String accountNumber, String transactionType, double amount, Timestamp transactionDate, String receiverAccountNumber) {
        this.accountNumber = accountNumber;
        this.transactionType = transactionType;
        this.amount = amount;
        this.transactionDate = transactionDate;
        this.receiverAccountNumber = receiverAccountNumber;
    }

    // Getters and setters
    public String getAccountNumber() { return accountNumber; }
    public void setAccountNumber(String accountNumber) { this.accountNumber = accountNumber; }
    
    public String getTransactionType() { return transactionType; }
    public void setTransactionType(String transactionType) { this.transactionType = transactionType; }
    
    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }
    
    public Timestamp getTransactionDate() { return transactionDate; }
    public void setTransactionDate(Timestamp transactionDate) { this.transactionDate = transactionDate; }
    
    public String getReceiverAccountNumber() { return receiverAccountNumber; }
    public void setReceiverAccountNumber(String receiverAccountNumber) { this.receiverAccountNumber = receiverAccountNumber; }
}
