package model;

public class UserDTO {
	private String name;
	private String addr;
	private int age;
	private String nation;
	private String id;
	private String passwd;
	private String gender;
	private String email;
	public UserDTO() {
		gender = "남성";
		nation ="한국";
		age =0;
		name = "3H";
	}
	
	@Override
	public String toString() {
		return "UserDTO [name=" + name + ", addr=" + addr + ", age=" + age + ", nation=" + nation + ", id=" + id
				+ ", passwd=" + passwd + ", gender=" + gender + ", email=" + email + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
