package bean;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Embeddable
public class ProjectDetailID implements Serializable {
	
	@Column(name="project_detail_id",nullable = false)
	private int project_detail_id;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "projectid", updatable = false,nullable = false)
	@JoinColumn(name = "year", updatable = false,nullable = false)
    private Project project;

	public int getProject_detail_id() {
		return project_detail_id;
	}

	public void setProject_detail_id(int project_detail_id) {
		this.project_detail_id = project_detail_id;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public ProjectDetailID() {
		super();
	}

	public ProjectDetailID(int project_detail_id, Project project) {
		super();
		this.project_detail_id = project_detail_id;
		this.project = project;
	}
	
	
}
