package bean;

import javax.persistence.*;

@Entity
@Table(name="project_picture")
public class ProjectPicture{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="project_pictureid",nullable = false,length = 5)
	private int project_pictureid;
	
	@Column(name="project_picture",nullable = false,length = 100)
	private String project_picture;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="project_detail_id",nullable = false, referencedColumnName = "project_detail_id")
	@JoinColumn(name = "projectid", nullable = false, referencedColumnName = "projectid")
	@JoinColumn(name = "year", nullable = false, referencedColumnName = "year")
	private ProjectDetail project_detail = new ProjectDetail();
	
	public ProjectDetail getProject_detail() {
		return project_detail;
	}

	public void setProject_detail(ProjectDetail project_detail) {
		this.project_detail = project_detail;
	}

	public int getProject_pictureid() {
		return project_pictureid;
	}

	public void setProject_pictureid(int project_pictureid) {
		this.project_pictureid = project_pictureid;
	}

	public String getProject_picture() {
		return project_picture;
	}

	public void setProject_picture(String project_picture) {
		this.project_picture = project_picture;
	}

	public ProjectPicture(int project_pictureid, String project_picture) {
		super();
		this.project_pictureid = project_pictureid;
		this.project_picture = project_picture;
	}
	
	public ProjectPicture(String project_picture) {
		super();
		this.project_picture = project_picture;
	}
	
	//FK
	public int getProjectID() {
		return project_detail.getProjectID();
	}
	
	public String getProjectYear() {
		return project_detail.getProjectYear();
	}
	
	public int getProject_DetailID() {
		return project_detail.getProject_DetailID();
	}
	//END FK
	/*
	public ProjectPicture(String project_pictureid, String project_picture, ProjectDetail project_detail) {
		super();
		this.project_pictureid = project_pictureid;
		this.project_picture = project_picture;
		this.project_detail = project_detail;
	}
	*/
	public ProjectPicture(String project_picture, ProjectDetail project_detail) {
		super();
		this.project_picture = project_picture;
		this.project_detail = project_detail;
	}

	public ProjectPicture() {
		super();
	}
	
	
}