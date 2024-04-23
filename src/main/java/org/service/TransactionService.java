package org.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.db.DBConfig;
import org.model.Transaction;

public class TransactionService{
	Connection connection = DBConfig.getCon();
	
	public List<Transaction> getAllTransactions(int patronId) {
        List<Transaction> transactions = new ArrayList<>();
        try {
        	
             Statement stmt = connection.createStatement();
             String selectQuery = "SELECT b.*, t.* FROM transactions t JOIN books b ON t.bookId = b.bookId WHERE t.patronId="+patronId+";";
             ResultSet rs = stmt.executeQuery(selectQuery);

            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(Integer.parseInt(rs.getString("transactionId")));
                transaction.setPatronId(rs.getInt("patronId"));
                transaction.setBookId(rs.getInt("bookId"));
                transaction.setBorrowDate(rs.getString("borrowDate"));
                transaction.setDueDate(rs.getString("dueDate"));
                transaction.setImage(rs.getString("image"));
                transaction.setAuthor(rs.getString("author"));
                transaction.setTitle(rs.getString("title"));
                transaction.setStatus(rs.getString("status"));
                transactions.add(transaction);
            }
            return transactions;
        }catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        
}}