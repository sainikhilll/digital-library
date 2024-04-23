package org.model;

public class Patron {
    private int patronId;
    private String name;
    private String email;
    private String password;
    private int studentId;
    private String address;
    private String university;
	public int getPatronId() {
		return patronId;
	}
	public void setPatronId(int patronId) {
		this.patronId = patronId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	@Override
	public String toString() {
		return "Patron [patronId=" + patronId + ", name=" + name + ", email=" + email + ", password=" + password
				+ ", studentId=" + studentId + ", address=" + address + ", university=" + university + "]";
	}
	public Patron(int patronId, String name, String email, String password, int studentId, String address,
			String university) {
		super();
		this.patronId = patronId;
		this.name = name;
		this.email = email;
		this.password = password;
		this.studentId = studentId;
		this.address = address;
		this.university = university;
	}
	public Patron() {
		super();
	}
    
    
    
}
