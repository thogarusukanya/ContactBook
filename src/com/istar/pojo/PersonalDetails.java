package com.istar.pojo;

public class PersonalDetails
{
	private int id;
	private String name;
	private Long telno;
	private String dob;
	private String address;
	private String nickname;
	private String type;
	private String relationship;
	private String website;
	private String companyname;
	private Long landlineno;
	public PersonalDetails()
	{
		super();
	}
public PersonalDetails(int id,String name,Long telno,String dob,String address,String nickname,String type,String relationship,String website,String companyname,Long landlineno)
	{	
	super();
	this.id=id;
	this.name=name;
	this.telno=telno;
	this.dob=dob;
	this.address=address;
	this.nickname=nickname;
	this.type=type;
	this.relationship=relationship;
	this.website=website;
	this.companyname=companyname;
	this.landlineno=landlineno;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getTelno() {
		return telno;
	}
	public void setTelno(Long telno) {
		this.telno = telno;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRelationship() {
		return relationship;
	}
	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public Long getLandlineno() {
		return landlineno;
	}
	public void setLandlineno(Long landlineno) {
		this.landlineno = landlineno;
	}
	@Override
	public String toString() {
		return "PersonalDetails [id=" + id + ", name=" + name + ", telno=" + telno + ", dob=" + dob + ", address="
				+ address + ", nickname=" + nickname + ", type=" + type + ", relationship=" + relationship
				+ ", website=" + website + ", companyname=" + companyname + ", landlineno=" + landlineno + "]";
	}
	
	
	}

