package com.lxit.crmsystem.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lxit.crmsystem.service.ContractService;
import com.lxit.crmsystem.vo.Staffs;
import com.lxit.crmsystem.vo.ViewContract;
import com.lxit.crmsystem.vo.ViewContractTwo;
import com.lxit.crmsystem.vo.ViewIdentType;

@RequestMapping("contract")
@Controller
public class ContractContriller {

	@Autowired
	ContractService cs;

	@RequestMapping("contractType")
	@ResponseBody
	public List<ViewIdentType> babyType() {
		return cs.queryType();
	}

	@RequestMapping("contractStatr")
	@ResponseBody
	public List<ViewIdentType> babyStatr() {
		return cs.queryState();
	}

	@RequestMapping("contractAdd")
	@ResponseBody
	public boolean contractAdd(HttpSession session, String name, String type, Double price, String jia, String yi,
			String jiaqz, String yiqz, String context, String remark) {
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("type", type);
		map.put("price", price);
		map.put("jia", jia);
		map.put("yi", yi);
		map.put("jiaqz", jiaqz);
		map.put("yiqz", yiqz);
		map.put("context", context);
		map.put("remark", remark);
		map.put("sid", ((Staffs) session.getAttribute("staff")).getStaffId());
		return cs.insert(map) > 0;
	}

	@RequestMapping("contractQuerys")
	@ResponseBody
	public Map<String, Object> contractQuery(HttpSession session, String name, Integer type, Integer state,
			Integer page, Integer rows) {
		Map<String, Object> map = getPageParem(page, rows);
		map.put("name", name);
		map.put("type", type);
		map.put("state", state);
		map.put("sid", ((Staffs) session.getAttribute("staff")).getStaffId());
		Map<String, Object> cdata = cs.contractQuery(map);
		session.setAttribute("lv", cdata.get("lv"));
		return cdata;
	}

	@RequestMapping("selectContract")
	@ResponseBody
	public Map<String, Object> selectContract(String name, Integer page, Integer rows) {
		Map<String, Object> map = getPageParem(page, rows);
		map.put("name", name);
		return cs.selectContract(map);
	}

	public Map<String, Object> getPageParem(Integer page, Integer rows) {
		Map<String, Object> map = new HashMap<>();
		map.put("page", ((page == 0 ? 1 : page) - 1) * rows);
		map.put("rows", rows);
		return map;
	}

	@RequestMapping("contractQueryView")
	@ResponseBody
	public ViewContract getViewContract(int id) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		return cs.contractQueryDetail(map);
	}

	@RequestMapping("updateContract")
	@ResponseBody
	public boolean updateContract(HttpSession session, String name, String type, Double price, String jia, String yi,
			String jiaqz, String yiqz, String context, String remark, Integer id) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("type", type);
		map.put("price", price);
		map.put("jia", jia);
		map.put("yi", yi);
		map.put("jiaqz", jiaqz);
		map.put("yiqz", yiqz);
		map.put("context", context);
		map.put("remark", remark);
		map.put("sid", ((Staffs) session.getAttribute("staff")).getStaffId());
		return cs.update(map) > 0;
	}

	@RequestMapping("deletecontes")
	@ResponseBody
	public boolean deletecontes(Integer id) {
		return cs.delet(id) > 0;
	}

	@RequestMapping("updateState")
	@ResponseBody
	public boolean updateState(Integer id) {
		return cs.updateState(id) > 0;
	}

	@RequestMapping("sendContractCon")
	public String sendContractCon(Integer cid, HttpServletRequest request) {
		ViewContractTwo vct = cs.selectOneCon(cid);
		request.setAttribute("vct", vct);
		return "contractControll";
	}

	@RequestMapping("contractSave")
	@ResponseBody
	public String contractSave(Integer parm14, String conContext, String conType, HttpSession session) {
		// parm14 合同ID conContext 变更原因 conType 变更后的类型
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String datetime = tempDate.format(new java.util.Date());
		Staffs userStaff = (Staffs) session.getAttribute("staff");
		ViewContractTwo vct = new ViewContractTwo();
		vct.setParm14(parm14);
		vct.setParm10(conContext);
		vct.setParm11(conType);
		vct.setParm12(datetime);
		vct.setParm13(userStaff.getStaffId() + "");
		cs.insertContractUpd(vct);
		cs.updateContr(vct);
		return "true";
	}

	@RequestMapping("upcontractState")
	@ResponseBody
	public boolean upcontractState(Integer id, Integer state) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("state", state);
		return cs.updateContrState(map) > 0;
	}

}