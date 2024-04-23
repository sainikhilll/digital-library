package org.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.db.DBConfig;
import org.model.Book;

public class BookService {
	Connection connection = DBConfig.getCon();
	
	public List<Book> getAllBooks(){
		try {
			List<Book> books = new ArrayList<>();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from Books;");
			
			while(resultSet.next()){
				Book book = new Book();
				book.setBookId(Integer.parseInt(resultSet.getString("bookId")));
				book.setAuthor(resultSet.getString("author"));
				book.setLanguage(resultSet.getString("language"));
				book.setImage(resultSet.getString("image"));
				book.setPages(Integer.parseInt(resultSet.getString("pages")));
				book.setSummary(resultSet.getString("summary"));
				book.setTitle(resultSet.getString("title"));
				
				books.add(book);
			}
			return books;
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
