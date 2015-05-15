package com.InstaVitals.kafka.model;

import java.util.Date;

public class VitalRecord {

	private long id;
	private long patientId;
	private Date visitDate;
	private String patientName;
	private String temprature;
	private String bp;
	private String bp2;
	private String weight;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getPatientId() {
		return patientId;
	}

	public void setPatientId(long patientId) {
		this.patientId = patientId;
	}

	public Date getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getTemprature() {
		return temprature;
	}

	public void setTemprature(String temprature) {
		this.temprature = temprature;
	}

	public String getBp() {
		return bp;
	}

	public void setBp(String bp) {
		this.bp = bp;
	}

	public String getBp2() {
		return bp2;
	}

	public void setBp2(String bp2) {
		this.bp2 = bp2;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	@Override
    public int hashCode() {
	    final int prime = 31;
	    int result = 1;
	    result = prime * result + (int) (id ^ (id >>> 32));
	    return result;
    }

	@Override
    public boolean equals(Object obj) {
	    if (this == obj)
		    return true;
	    if (obj == null)
		    return false;
	    if (getClass() != obj.getClass())
		    return false;
	    VitalRecord other = (VitalRecord) obj;
	    if (id != other.id)
		    return false;
	    return true;
    }

	@Override
    public String toString() {
	    return "VitalRecord [id=" + id + ", patientId=" + patientId
	        + ", visitDate=" + visitDate + ", patientName=" + patientName
	        + ", temprature=" + temprature + ", bp=" + bp + ", bp2=" + bp2
	        + ", weight=" + weight + "]";
    }

	
}
