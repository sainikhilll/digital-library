package org.model;

public class Transaction{
	private int transactionId;
	private int patronId;
	private int bookId;
	private String borrowDate;
	private String dueDate;
	private String image;
	private String author;
	private String title;
	private String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Transaction() {
		super();
	}
	@Override
	public String toString() {
		return "Transaction [transactionId=" + transactionId + ", patronId=" + patronId + ", bookId=" + bookId
				+ ", borrowDate=" + borrowDate + ", dueDate=" + dueDate + ", image=" + image + ", author=" + author
				+ ", title=" + title + ", getTransactionId()=" + getTransactionId() + ", getPatronId()=" + getPatronId()
				+ ", getBookId()=" + getBookId() + ", getBorrowDate()=" + getBorrowDate() + ", getDueDate()="
				+ getDueDate() + ", getImage()=" + getImage() + ", getAuthor()=" + getAuthor() + ", getTitle()="
				+ getTitle() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	public int getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}
	public int getPatronId() {
		return patronId;
	}
	public void setPatronId(int patronId) {
		this.patronId = patronId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBorrowDate() {
		return borrowDate;
	}
	public void setBorrowDate(String borrowDate) {
		this.borrowDate = borrowDate;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
}