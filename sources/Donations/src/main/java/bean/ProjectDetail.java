package bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="project_detail")
public class ProjectDetail implements Serializable{
	
	@EmbeddedId
	private ProjectDetailID project_detailPK = new ProjectDetailID();
	
	@Column(name="project_detail",nullable = false,columnDefinition = "LONGTEXT")
	private String project_detail;
	
	@Column(name="start_project",nullable = false)
	private Calendar start_project;
	
	@Column(name="end_project",nullable = false)
	private Calendar end_project;
	
	@OneToMany(cascade = CascadeType.ALL,mappedBy="project_detail")
    private List<ProjectPicture> project_picture = new ArrayList();

	public List<ProjectPicture> getProject_picture() {
		return project_picture;
	}

	public void setProject_picture(List<ProjectPicture> project_picture) {
		this.project_picture = project_picture;
	}

	public ProjectDetailID getProject_detailPK() {
		return project_detailPK;
	}

	public void setProject_detailPK(ProjectDetailID project_detailPK) {
		this.project_detailPK = project_detailPK;
	}

	public String getProject_detail() {
		return project_detail;
	}

	public void setProject_detail(String project_detail) {
		this.project_detail = project_detail;
	}

	public Calendar getStart_project() {
		return start_project;
	}

	public void setStart_project(Calendar start_project) {
		this.start_project = start_project;
	}

	public Calendar getEnd_project() {
		return end_project;
	}

	public void setEnd_project(Calendar end_project) {
		this.end_project = end_project;
	}

	//Key PK FK
	public int getProject_DetailID() {
		return project_detailPK.getProject_detail_id();
	}
	
	public int getProjectID() {
		return project_detailPK.getProject().getProjectPK().getProjectID();
	}
	
	public String getProjectYear() {
		return project_detailPK.getProject().getProjectPK().getYear();
	}
	//END
	//ID
	public String getIDtoString() {
		return String.valueOf(getProjectID())+"_"+getProjectYear()+"_"+String.valueOf(getProject_DetailID());
	}
	//END
	public ProjectDetail(String project_detail, Calendar start_project, Calendar end_project) {
		super();
		this.project_detail = project_detail;
		this.start_project = start_project;
		this.end_project = end_project;
	}

	public ProjectDetail() {
		super();
	}
	
	
/*
	@OneToMany(cascade = CascadeType.ALL,mappedBy = "project_detail")
    private List<Donation> donation;
*/
}