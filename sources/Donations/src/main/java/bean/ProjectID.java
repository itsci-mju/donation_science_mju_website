package bean;

import java.io.Serializable;

import javax.persistence.*;

@Embeddable
public class ProjectID implements Serializable {
	
	@Column(name="projectID",nullable = false)
    private int projectID;

	@Column(name="year",nullable = false,length = 4)
    private String year;

    // default constructor

    public ProjectID(int projectID, String year) {
        this.projectID = projectID;
        this.year = year;
    }

	public int getProjectID() {
		return projectID;
	}

	public void setProjectID(int projectID) {
		this.projectID = projectID;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public ProjectID() {
		super();
	}
    
    
}