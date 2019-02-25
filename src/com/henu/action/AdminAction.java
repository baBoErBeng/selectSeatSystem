package com.henu.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.henu.bean.*;
import com.henu.service.AdminService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@Component(value="adminAction")
@Scope("prototype")
public class AdminAction extends ActionSupport{
	@Resource
	private AdminService adminService;
	private Admin admin;
	private Student student;
	private Seat seat;
	private Notice notice;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private InputStream attrInputStream;
	private String selectType;
	private String parm;
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Seat getSeat() {
		return seat;
	}
	public void setSeat(Seat seat) {
		this.seat = seat;
	}
	public Notice getNotice() {
		return notice;
	}
	public void setNotice(Notice notice) {
		this.notice = notice;
	}
	
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public InputStream getAttrInputStream() {
		return attrInputStream;
	}
	public void setAttrInputStream(InputStream attrInputStream) {
		this.attrInputStream = attrInputStream;
	}
    
	public String getSelectType() {
		return selectType;
	}
	public void setSelectType(String selectType) {
		this.selectType = selectType;
	}
	public String getParm() {
		return parm;
	}
	public void setParm(String parm) {
		this.parm = parm;
	}
	/**
	 * 管理员登录
	 * @return
	 */
	public String login(){
		if(adminService.login(admin.getAdm_num(), admin.getAdm_password())){
			Admin adm = adminService.getAdminByNumber(admin.getAdm_num());
			ActionContext.getContext().getSession().put("admin", adm);
			return "login";
		}else{
			return "index";
		}
	}
	/**
	 * 学生管理页面
	 * @return
	 */
	public String mangeStudent(){
		List<Student> list = adminService.readStudents();
		ActionContext.getContext().getSession().put("students", list);
		return "mangeStudent";
	}
	/**
	 * 座位管理页面
	 * @return
	 */
	public String mangeSeat(){
		List<Seat> list = adminService.readSeats();
		ActionContext.getContext().getSession().put("seats", list);
		return "mangeSeat";
	}
	/**
	 * 审查信息管理页面
	 * @return
	 */
	public String mangeCheckMessage(){
		List<Seat> list = adminService.readCheckMessage();
		ActionContext.getContext().getSession().put("checkMessage", list);
		return "mangeCheckMessage";
	}
	/**
	 * 修复信息管理页面
	 * @return
	 */
	public String mangeRepairMessage(){
		List<Seat> list = adminService.readRepairMessage();
		ActionContext.getContext().getSession().put("repairMessage", list);
		return "mangeRepairMessage";
	}
	/**
	 * 公告管理页面
	 * @return
	 */
	public String mangeNotice(){
		List<Notice> list = adminService.readNotices();
		ActionContext.getContext().getSession().put("notices", list);
		return "mangeNotice";
	}
	/**
	 * 添加学生
	 * @return
	 */
	public String addStudent(){
		student.setStu_id(null);
		adminService.saveStudent(student);
		return "addStudent";
	}
	/**
	 * 修改学生信息页面
	 * @return
	 */
	public String toUpdateStudent(){
		String[] stu_id = (String[])ActionContext.getContext().getParameters().get("stu_id");
		Student stu = adminService.getStudent(stu_id[0]);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("student", stu);
		return "toUpdateStudent";
	}
	/**
	 * 修改学生信息
	 * @return
	 */
	public String updateStudent(){
		Student oldStudent = adminService.getStudent(student.getStu_id());
		student.setSeat_id(oldStudent.getSeat_id());
		adminService.updateStudent(student);
		return "updateStudent";
	}
	/**
	 * 删除学生信息
	 * @return
	 */
	public String deleteStudent(){
		String[] stu_id = (String[])ActionContext.getContext().getParameters().get("stu_id");
		Student stu = adminService.getStudent(stu_id[0]);
		adminService.deleteStudent(stu);
		return "deleteStudent";
	}
	/**
	 * 添加座位
	 * @return
	 */
	public String addSeat(){
		seat.setSeat_id(null);
		seat.setSeat_status("booked");
		seat.setSeat_condiction("good");
		adminService.saveSeat(seat);
		return "addSeat";
	}
	/**
	 * 删除座位信息
	 * @return
	 */
	public String deleteSeat(){
		String[] seat_id = (String[])ActionContext.getContext().getParameters().get("seat_id");
		Seat seat = adminService.getSeat(seat_id[0]);
		adminService.deleteSeat(seat);
		return "deleteSeat";
	}
	/**
	 * 修改座位页面
	 * @return
	 */
	public String toUpdateSeat(){
		String[] seat_id = (String[])ActionContext.getContext().getParameters().get("seat_id");
		Seat seat = adminService.getSeat(seat_id[0]);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("seat", seat);
		return "toUpdateSeat";
	}
	/**
	 * 修改座位信息
	 * @return
	 */
	public String updateSeat(){
		Seat oldSeat = adminService.getSeat(seat.getSeat_id());
		seat.setSeat_status(oldSeat.getSeat_status());
		seat.setSeat_condiction(oldSeat.getSeat_condiction());
		seat.setStu_id(oldSeat.getStu_id());
		adminService.updateSeat(seat);
		return "updateSeat";
	}
	/**
	 * 添加损坏座位页面
	 * @return
	 */
	public String mangeAddCheckMessage(){
		List<Seat> seats = adminService.readSeats("seat_condiction", "good");
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("goodSeatMessage", seats);
		return "mangeAddCheckMessage";
	}
	/**
	 * 添加待审查损坏座位
	 * @return
	 */
	public String addCheckMessage(){
		String[] seat_id = (String[])ActionContext.getContext().getParameters().get("seat_id");
		Seat seat = adminService.getSeat(seat_id[0]);
		adminService.saveCheckMessage(seat);
		return "addCheckMessage";
	}
	/**
	 * 删除待审查座位信息
	 * @return
	 */
	public String deleteCheckMessage(){
		String[] seat_id = (String[])ActionContext.getContext().getParameters().get("seat_id");
		Seat seat = adminService.getSeat(seat_id[0]);
		adminService.repairSeat(seat);
		return "deleteCheckMessage";
	}
	/**
	 * 添加待修复损坏座位
	 * @return
	 */
	public String addRepairMessage(){
		String[] seat_id = (String[])ActionContext.getContext().getParameters().get("seat_id");
		Seat seat = adminService.getSeat(seat_id[0]);
		adminService.saveRepairMessage(seat);
		return "addRepairMessage";
	}
	/**
	 * 修复座位
	 * @return
	 */
	public String repairSeat(){
		String[] seat_id = (String[])ActionContext.getContext().getParameters().get("seat_id");
		Seat seat = adminService.getSeat(seat_id[0]);
		adminService.repairSeat(seat);
		return "repairSeat";
	}
	/**
	 * 查看内容公告
	 * @return
	 */
	public String readNotice(){
		String[] notice_id = (String[])ActionContext.getContext().getParameters().get("notice_id");
		Notice notice = adminService.getNotice(Integer.parseInt(notice_id[0]));
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("notice", notice);
		request.setAttribute("refer", "/adminMangeNotice");
		return "readNotice";
	}
	/**
	 * 增加公告
	 * @return
	 * @throws IOException 
	 */
	public String addNotice() throws IOException{
		String realpath = ServletActionContext.getServletContext().getRealPath("/upload");
		if(upload!=null){
			File saveDir = new File(realpath);
			if(!saveDir.exists())
				saveDir.mkdirs();
			File saveFile = new File(saveDir,uploadFileName);
			FileUtils.copyFile(upload, saveFile);
			System.out.println("文件上传成功！");
			notice.setNotice_file(uploadFileName);
		}else{
			notice.setNotice_file(null);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String dateStringParse = sdf.format(date);
		Admin admin = (Admin)ActionContext.getContext().getSession().get("admin");
		notice.setAdm_id(admin.getAdm_id());
		notice.setNotice_time(dateStringParse);
		notice.setNotice_id(0);
		adminService.saveNotice(notice);
		return "addNotice";
	}
	/**
	 * 修改公告页面
	 * @return
	 */
	public String toUpdateNotice(){
		String[] notice_id = (String[])ActionContext.getContext().getParameters().get("notice_id");
		Notice notice = adminService.getNotice(Integer.parseInt(notice_id[0]));
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("notice", notice);
		return "toUpdateNotice";
	}
	/**
	 * 修改公告
	 * @return
	 * @throws IOException 
	 */
	public String updateNotice() throws IOException{
		Notice oldNotice = adminService.getNotice(notice.getNotice_id());
		String realpath = ServletActionContext.getServletContext().getRealPath("/upload");
		if(upload!=null){
			File saveDir = new File(realpath);
			if(!saveDir.exists())
				saveDir.mkdirs();
			File saveFile = new File(saveDir,uploadFileName);
			FileUtils.copyFile(upload, saveFile);
			System.out.println("文件修改成功！");
			notice.setNotice_file(uploadFileName);
		}else{
			notice.setNotice_file(oldNotice.getNotice_file());
		}
		notice.setNotice_time(oldNotice.getNotice_time());
		notice.setAdm_id(oldNotice.getAdm_id());
		adminService.updateNotice(notice);
		return "updateNotice";
	}
	/**
	 * 删除公告
	 * @return
	 */
	public String deleteNotice(){
		String[] notice_id = (String[])ActionContext.getContext().getParameters().get("notice_id");
		Notice notice = adminService.getNotice(Integer.parseInt(notice_id[0]));
		adminService.deleteNotice(notice);
		return "deleteNotice";
	}
	/**
	 * 下载附件
	 * @return
	 * @throws FileNotFoundException
	 * @throws UnsupportedEncodingException
	 */
	public String download() throws FileNotFoundException, UnsupportedEncodingException{
		String realpath = ServletActionContext.getServletContext().getRealPath("/upload");
		Notice nt = adminService.getNotice(notice.getNotice_id());
		String path = realpath+"\\"+nt.getNotice_file();
		System.out.println(path);
		attrInputStream = new FileInputStream(path);
		return "download";
	}
	/**
	 * 修改附件名称格式
	 * @return
	 */
	public String getDownloadFileName() {
		Notice nt = adminService.getNotice(notice.getNotice_id());
		String downFileName = nt.getNotice_file();
		try {
		downFileName = new String(downFileName.getBytes(), "ISO8859-1");
		} catch (UnsupportedEncodingException e) {

		e.printStackTrace();

		}
		return downFileName;
	}
	/**
	 * 学生搜索页面
	 * @return
	 */
	public String searchStudent(){
		List<Student> list = adminService.readStudents(selectType, parm);
		ActionContext.getContext().getSession().put("students", list);
		return "searchStudent";
	}
	/**
	 * 座位搜索页面
	 * @return
	 */
	public String searchSeat(){
		List<Seat> list = adminService.readSeats(selectType, parm);
		ActionContext.getContext().getSession().put("seats", list);
		return "searchSeat";
	}
	/**
	 * 待审查信息搜索页面
	 * @return
	 */
	public String searchCheckMessage(){
		List<Seat> list = adminService.readCheckMessage(selectType, parm);
		ActionContext.getContext().getSession().put("checkMessage", list);
		return "searchCheckMessage";
	}
	/**
	 * 待修复信息搜索页面
	 * @return
	 */
	public String searchRepairMessage(){
		List<Seat> list = adminService.readRepairMessage(selectType, parm);
		ActionContext.getContext().getSession().put("repairMessage", list);
		return "searchRepairMessage";
	}
	/**
	 * 公告搜索页面
	 * @return
	 */
	public String searchNotice(){
		List<Notice> list = adminService.readNotices(selectType, parm);
		ActionContext.getContext().getSession().put("notices", list);
		return "searchNotice";
	}
	/**
	 * 搜索未损坏座位
	 * @return
	 */
	public String searchGoodSeatMessage(){
		List<Seat> seats = adminService.readGoodMessage(selectType, parm);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("goodSeatMessage", seats);
		return "searchGoodSeatMessage";
	}
}
