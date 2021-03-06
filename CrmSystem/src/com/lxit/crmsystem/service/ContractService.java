package com.lxit.crmsystem.service;

import java.util.List;
import java.util.Map;

import com.lxit.crmsystem.vo.ViewContract;
import com.lxit.crmsystem.vo.ViewContractTwo;
import com.lxit.crmsystem.vo.ViewIdentType;

public interface ContractService {

	public List<ViewIdentType> queryType();

	public List<ViewIdentType> queryState();

	public int insert(Map<String, Object> map);

	public Map<String, Object> contractQuery(Map<String, Object> map);

	public Map<String, Object> selectContract(Map<String, Object> map);

	public ViewContractTwo selectOneCon(int cid);

	public ViewContract contractQueryDetail(Map<String, Object> map);

	public int update(Map<String, Object> map);

	public int delet(int id);

	public int updateState(int id);

	public int insertContractUpd(ViewContractTwo vct);

	public int updateContr(ViewContractTwo vct);

	public int updateContrState(Map<String, Object> map);

}
