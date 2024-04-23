package org.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.db.DBConfig;
import org.model.Book;
import org.model.Patron;

public class PatronService {
Connection connection = DBConfig.getCon();
	
	public Patron getPatronById(int patronId){
		try {
			
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from Patron where patronId="+patronId+";");
			
			if(resultSet.next()){
				Patron patron = new Patron();
			
					patron.setName(resultSet.getString("name"));
			        patron.setUniversity(resultSet.getString("university"));
			        patron.setStudentId(Integer.parseInt(resultSet.getString("studentId")));
			        patron.setEmail(resultSet.getString("email"));
			        patron.setPassword(resultSet.getString("password"));
			        patron.setAddress(resultSet.getString("address"));
			        return patron;
	
			}
		
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
