package bean;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="project")
//@IdClass(ProjectID.class)
public class Project{
	
	@EmbeddedId
	private ProjectID projectPK = new ProjectID();
	
	@Column(name="time",nullable = false)
	private int time;
	
	@Column(name="title",nullable = false,length = 150)
	private String title;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "projectid")
	@JoinColumn(name = "year")
    private List<ProjectDetail> project_detail = new ArrayList();

	public ProjectID getProjectPK() {
		return projectPK;
	}

	public void setProjectPK(ProjectID projectPK) {
		this.projectPK = projectPK;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<ProjectDetail> getProject_detail() {
		return project_detail;
	}

	public void setProject_detail(List<ProjectDetail> project_detail) {
		this.project_detail = project_detail;
	}
	
	//PK
	public int getProjectID() {
		return projectPK.getProjectID();
	}
	public String getProjectYear() {
		return projectPK.getYear();
	}
	//END

	public Project(ProjectID projectPK, int time, String title, List<ProjectDetail> project_detail) {
		super();
		this.projectPK = projectPK;
		this.time = time;
		this.title = title;
		this.project_detail = project_detail;
	}
	//AddProject
	public Project(int time, String title, List<ProjectDetail> project_detail) {
		super();
		this.projectPK.setYear(String.valueOf(new Date().getYear() + 2443));
		this.time = time;
		this.title = title;
		this.project_detail = project_detail;
	}
	//test AddProject
	public Project(int time, String title) {
		super();
		this.projectPK.setYear(String.valueOf(new Date().getYear() + 2443));
		this.time = time;
		this.title = title;
	}

	public Project() {
		super();
	}
	
	
}