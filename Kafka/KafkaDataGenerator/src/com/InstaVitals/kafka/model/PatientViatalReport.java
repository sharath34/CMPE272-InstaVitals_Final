package com.InstaVitals.kafka.model;

import java.util.Map;

public class PatientViatalReport {
	private long id;
	private Patient patient;
	private Hospital hospital;
	
	private Map<String, Object> report;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public Hospital getHospital() {
		return hospital;
	}

	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}

	public Map<String, Object> getReport() {
		return report;
	}

	public void setReport(Map<String, Object> report) {
		this.report = report;
	}

	@Override
	public String toString() {
		return "PatientViatalReport [patient=" + patient + ", hospital="
		    + hospital + ", report=" + report + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
		    + ((hospital == null) ? 0 : hospital.hashCode());
		result = prime * result + ((patient == null) ? 0 : patient.hashCode());
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
		PatientViatalReport other = (PatientViatalReport) obj;
		if (hospital == null) {
			if (other.hospital != null)
				return false;
		} else if (!hospital.equals(other.hospital))
			return false;
		if (patient == null) {
			if (other.patient != null)
				return false;
		} else if (!patient.equals(other.patient))
			return false;
		return true;
	}

}
