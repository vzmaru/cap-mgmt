package com.tuc.capacity.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;

import com.tuc.capacity.entity.Associate;
import com.tuc.capacity.entity.Project;
import com.tuc.capacity.entity.ProjectAllocation;
import com.tuc.capacity.entity.ProjectGroup;
import com.tuc.capacity.entity.Sow;
import com.tuc.capacity.entity.TuLead;
import com.tuc.capacity.entity.mstr.Location;
import com.tuc.capacity.entity.mstr.ProjectRole;
import com.tuc.capacity.entity.mstr.ProjectType;
import com.tuc.capacity.entity.mstr.Rate;
import com.tuc.capacity.entity.mstr.Skill;

public class RosterService {
	public List<ProjectAllocation> findRosterEntries(int firstResult, int maxResults) {
		List<ProjectAllocation> list = null;
		
		return list;
	}

	public void addRecord(List<String> rowData) {
		if (rowData.size() < 16) {
			return;
		}
		// TODO - extract mapping in other class
		String eid = rowData.get(0);
		String finCtrlNum = rowData.get(1);
		String sowName = rowData.get(2);
		String tuLeadName = rowData.get(3);
		String tuLeadName1 = rowData.get(4);
		String tuLeadName2 = rowData.get(5);
		String role = rowData.get(6);
		String skillStr = rowData.get(7);
		String grpName = rowData.get(8);
		String prjName = rowData.get(9);
		
		String pTypeName = rowData.get(12);
		String activeStatus = rowData.get(13);
		
		String empId = rowData.get(15);
		String name = rowData.get(16);
		
		String rateVal = rowData.get(20);
		
		String offOn = rowData.get(22);
		String loc = rowData.get(23);
		
		if (StringUtils.isBlank(name)) {
			return;
		}
		
		// Skills
		String[] skillArr = skillStr.split(",");
		Set<Skill> skills = new HashSet<Skill>();
		
		List<Skill> skResList = null;
		Skill skillObj = null;
		for (String skill : skillArr) {
			skill = skill.trim();
			if (StringUtils.isBlank(skill)) {
				continue;
			}
			skResList = Skill.findSkillsBySkillNameEquals(skill).getResultList();
			if (skResList == null || skResList.size() == 0) {
				skillObj = new Skill();
				skillObj.setSkillName(skill);
				skillObj.persist();
			} else {
				skillObj = skResList.get(0);
			}
			skills.add(skillObj);
		}
		
		// associate
		Associate asc = null;
		List<Associate> ascResList = null;
		if (StringUtils.isNotBlank(eid)) {
			ascResList = Associate.findAssociatesByEidEquals(eid).getResultList();
		} else if (StringUtils.isNotBlank(empId)) {
			ascResList = Associate.findAssociatesByEmpIdEquals(empId).getResultList();
		}
		if (ascResList == null || ascResList.size() == 0) {
			asc = new Associate();
			asc.setEid(eid);
			asc.setEmpId(empId);
			asc.setName(name);
			asc.setSkills(skills);
			asc.setStatus(activeStatus);
			asc.persist();
		}
		
		// Tu Lead
		TuLead tuLead = null;
		List<TuLead> ldResList = null;
		if (StringUtils.isNotBlank(tuLeadName)) {
			ldResList = TuLead.findTuLeadsByNameEquals(tuLeadName).getResultList();
			if (ldResList == null || ldResList.size() == 0) {
				tuLead = new TuLead();
				tuLead.setName(tuLeadName);
				tuLead.persist();
			} else {
				tuLead = ldResList.get(0);
			}
		}

		TuLead tuLead1 = null;
		List<TuLead> ldResList1 = null;
		if (StringUtils.isNotBlank(tuLeadName1)) {
			ldResList1 = TuLead.findTuLeadsByNameEquals(tuLeadName1).getResultList();
			if (ldResList1 == null || ldResList1.size() == 0) {
				tuLead1 = new TuLead();
				tuLead1.setName(tuLeadName1);
				tuLead1.persist();
			}
		}

		TuLead tuLead2 = null;
		List<TuLead> ldResList2 = null;
		if (StringUtils.isNotBlank(tuLeadName2)) {
			ldResList2 = TuLead.findTuLeadsByNameEquals(tuLeadName2).getResultList();
			if (ldResList2 == null || ldResList2.size() == 0) {
				tuLead2 = new TuLead();
				tuLead2.setName(tuLeadName2);
				tuLead2.persist();
			}
		}

		// Project Groups
		ProjectGroup prjGrp = null;
		List<ProjectGroup> prjGrpResList = null;
		if (StringUtils.isBlank(grpName)) {
			grpName = prjName;
		}
		if (StringUtils.isNotBlank(grpName)) {
			prjGrpResList = ProjectGroup.findProjectGroupsByNameEquals(grpName).getResultList();
			if (prjGrpResList == null || prjGrpResList.size() == 0) {
				prjGrp = new ProjectGroup();
				prjGrp.setName(grpName);
				prjGrp.setLead(tuLead);
				prjGrp.persist();
			} else {
				prjGrp = prjGrpResList.get(0);
			}
		}
		
		// Project Type
		ProjectType prjType = null;
		List<ProjectType> prjTypeResList = null;
		if (StringUtils.isNotBlank(pTypeName)) {
			prjTypeResList = ProjectType.findProjectTypesByTypeEquals(pTypeName).getResultList();
			if (prjTypeResList == null || prjTypeResList.size() == 0) {
				prjType = new ProjectType();
				prjType.setType(pTypeName);
				prjType.persist();
			} else {
				prjType = prjTypeResList.get(0);
			}
		}
		
		// Project
		Project prj = null;
		List<Project> prjResList = null;
		if (StringUtils.isNotBlank(prjName)) {
			prjResList = Project.findProjectsByNameEquals(prjName).getResultList();
			if (prjResList == null || prjResList.size() == 0) {
				prj = new Project();
				prj.setName(prjName);
				prj.setLead(tuLead);
				// prj.setSubLead(tuLead1);
				// prj.setManager(tuLead2);
				prj.setPrjGroup(prjGrp);
				prj.setType(prjType);
				prj.persist();
			} else {
				prj = prjResList.get(0);
			}
		}
		
		// Rate
		Rate rate = null;
		List<Rate> rateResList = null;
		String rateName = null;
		if (StringUtils.isNotBlank(rateVal) && StringUtils.isNotBlank(offOn) && StringUtils.length(finCtrlNum) > 6) {
			rateName = finCtrlNum.substring(0, 7) + offOn;
			rateResList = Rate.findRatesByNameEquals(rateName).getResultList();
			if (rateResList == null || rateResList.size() == 0) {
				try {
					rate = new Rate();
					rate.setName(rateName);
					rate.setRate(Double.valueOf(rateVal).intValue());
					rate.persist();
				} catch (Exception e) {
					rate = null;
				}
			} else {
				rate = rateResList.get(0);
			}
		}
		
		// Location
		Location location = null;
		List<Location> locResList = null;
		if (StringUtils.isNotBlank(loc)) {
			locResList = Location.findLocationsByLocationEquals(loc).getResultList();
			if (locResList == null || locResList.size() == 0) {
				location = new Location();
				location.setLocation(loc);
				location.persist();
			} else {
				location = locResList.get(0);
			}
		}
		
		// SOW
		String sowNum = StringUtils.substring(finCtrlNum, 0, 6);
		Sow sow = null;
		List<Sow> sowResList = null;
		if (StringUtils.isNotBlank(sowName) && sowNum.length() == 6) {
			sowResList = Sow.findSowsBySowNumEquals(sowNum).getResultList();
			if (sowResList == null || sowResList.size() == 0) {
				sow = new Sow();
				sow.setSowNum(sowNum);
				sow.setDescription(sowName);
			} else {
				sow = sowResList.get(0);
			}
		}
		
		// Role
		ProjectRole prjRole = null;
		List<ProjectRole> roleResList = null;
		if (StringUtils.isNotBlank(role)) {
			roleResList = ProjectRole.findProjectRolesByRoleNameEquals(role).getResultList();
			if (roleResList == null || roleResList.size() == 0) {
				prjRole = new ProjectRole();
				prjRole.setRoleName(role);
			} else {
				prjRole = roleResList.get(0);
			}
		}
		
		// Project Allocation
		ProjectAllocation allocation = null;
		allocation = new ProjectAllocation();
		allocation.setAssociate(asc);
		allocation.setProject(prj);
		allocation.setPrjRole(prjRole);
		allocation.setLocation(location);
		allocation.setRate(rate);
		allocation.setStartDate(null);
		allocation.setEndDate(null);
			
		// 
		
	}
}
