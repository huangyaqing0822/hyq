package com.lxit.crmsystem.vo;

import java.io.Serializable;

public class Staffs  implements Serializable{
	private Integer staffId;//员工id
	private String staffName;//员工姓名
	private String staffPass;//登录密码
	private String staffCoding;//员工编码
	private String staffSex;//员工性别
	private Integer staffState;//员工状态
	private String staffStateName;
	private String departmentName;//员工所属部门
	private Integer departmentId;//员工所属部门
	private String roleName;//员工所属角色
	private String staffRemark;//备注
	private String staffLastUpdateTime;//最后一次修改时间
	private String staffCreateTiem;//创建时间
	private String staffLoginName;//登录id
	private String standby;//备用字段
	private String staffUpdateSid;//最后一次修改人的ID
	private String staffUpdateName;//最后一次操作人的name
	private Integer staffNid;
	private Integer staffRid;
	private String stanftephone;//手机号码
	
	public String getStanftephone() {
		return stanftephone;
	}
	public void setStanftephone(String stanftephone) {
		this.stanftephone = stanftephone;
	}
	public Integer getStaffId() {
		return staffId;
	}
	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getStaffPass() {
		return staffPass;
	}
	public void setStaffPass(String staffPass) {
		this.staffPass = staffPass;
	}
	public String getStaffCoding() {
		return staffCoding;
	}
	public void setStaffCoding(String staffCoding) {
		this.staffCoding = staffCoding;
	}
	public String getStaffSex() {
		return staffSex;
	}
	public void setStaffSex(String staffSex) {
		this.staffSex = staffSex;
	}
	public Integer getStaffState() {
		return staffState;
	}
	public void setStaffState(Integer staffState) {
		this.staffState = staffState;
	}
	
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getStaffRemark() {
		return staffRemark;
	}
	public void setStaffRemark(String staffRemark) {
		this.staffRemark = staffRemark;
	}
	public String getStaffLastUpdateTime() {
		return staffLastUpdateTime;
	}
	public void setStaffLastUpdateTime(String staffLastUpdateTime) {
		this.staffLastUpdateTime = staffLastUpdateTime;
	}
	public String getStaffCreateTiem() {
		return staffCreateTiem;
	}
	public void setStaffCreateTiem(String staffCreateTiem) {
		this.staffCreateTiem = staffCreateTiem;
	}
	public String getStaffLoginName() {
		return staffLoginName;
	}
	public void setStaffLoginName(String staffLoginName) {
		this.staffLoginName = staffLoginName;
	}
	public String getStandby() {
		return standby;
	}
	public void setStandby(String standby) {
		this.standby = standby;
	}
	@Override
	public String toString() {
		return "Staffs [staffId=" + staffId + ", staffName=" + staffName + ", staffPass=" + staffPass + ", staffCoding="
				+ staffCoding + ", staffSex=" + staffSex + ", staffState=" + staffState + ", departmentName="
				+ departmentName + ", roleName=" + roleName + ", staffRemark=" + staffRemark + ", staffLastUpdateTime="
				+ staffLastUpdateTime + ", staffCreateTiem=" + staffCreateTiem + ", staffLoginName=" + staffLoginName
				+ ", standby=" + standby + "]";
	}
	public String getStaffStateName() {
		if(staffState == 1){
			return "启用";
		}
		return "禁用";
	}
	public void setStaffStateName(String staffStateName) {
		this.staffStateName = staffStateName;
	}
	public String getStaffUpdateSid() {
		return staffUpdateSid;
	}
	public void setStaffUpdateSid(String staffUpdateSid) {
		this.staffUpdateSid = staffUpdateSid;
	}
	public String getStaffUpdateName() {
		return staffUpdateName;
	}
	public void setStaffUpdateName(String staffUpdateName) {
		this.staffUpdateName = staffUpdateName;
	}
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	public Integer getStaffRid() {
		return staffRid;
	}
	public void setStaffRid(Integer staffRid) {
		this.staffRid = staffRid;
	}
	public Integer getStaffNid() {
		return staffNid;
	}
	public void setStaffNid(Integer staffNid) {
		this.staffNid = staffNid;
	}
	
	
}
