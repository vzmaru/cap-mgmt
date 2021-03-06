// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tuc.capacity.entity.mstr;

import com.tuc.capacity.entity.mstr.ProjectRole;
import com.tuc.capacity.entity.mstr.ProjectRoleDataOnDemand;
import com.tuc.capacity.entity.mstr.ProjectRoleIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProjectRoleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ProjectRoleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ProjectRoleIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ProjectRoleIntegrationTest: @Transactional;
    
    @Autowired
    ProjectRoleDataOnDemand ProjectRoleIntegrationTest.dod;
    
    @Test
    public void ProjectRoleIntegrationTest.testCountProjectRoles() {
        Assert.assertNotNull("Data on demand for 'ProjectRole' failed to initialize correctly", dod.getRandomProjectRole());
        long count = ProjectRole.countProjectRoles();
        Assert.assertTrue("Counter for 'ProjectRole' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ProjectRoleIntegrationTest.testFindProjectRole() {
        ProjectRole obj = dod.getRandomProjectRole();
        Assert.assertNotNull("Data on demand for 'ProjectRole' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ProjectRole' failed to provide an identifier", id);
        obj = ProjectRole.findProjectRole(id);
        Assert.assertNotNull("Find method for 'ProjectRole' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ProjectRole' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ProjectRoleIntegrationTest.testFindAllProjectRoles() {
        Assert.assertNotNull("Data on demand for 'ProjectRole' failed to initialize correctly", dod.getRandomProjectRole());
        long count = ProjectRole.countProjectRoles();
        Assert.assertTrue("Too expensive to perform a find all test for 'ProjectRole', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ProjectRole> result = ProjectRole.findAllProjectRoles();
        Assert.assertNotNull("Find all method for 'ProjectRole' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ProjectRole' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ProjectRoleIntegrationTest.testFindProjectRoleEntries() {
        Assert.assertNotNull("Data on demand for 'ProjectRole' failed to initialize correctly", dod.getRandomProjectRole());
        long count = ProjectRole.countProjectRoles();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ProjectRole> result = ProjectRole.findProjectRoleEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ProjectRole' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ProjectRole' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ProjectRoleIntegrationTest.testFlush() {
        ProjectRole obj = dod.getRandomProjectRole();
        Assert.assertNotNull("Data on demand for 'ProjectRole' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ProjectRole' failed to provide an identifier", id);
        obj = ProjectRole.findProjectRole(id);
        Assert.assertNotNull("Find method for 'ProjectRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyProjectRole(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'ProjectRole' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ProjectRoleIntegrationTest.testMergeUpdate() {
        ProjectRole obj = dod.getRandomProjectRole();
        Assert.assertNotNull("Data on demand for 'ProjectRole' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ProjectRole' failed to provide an identifier", id);
        obj = ProjectRole.findProjectRole(id);
        boolean modified =  dod.modifyProjectRole(obj);
        Integer currentVersion = obj.getVersion();
        ProjectRole merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'ProjectRole' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ProjectRoleIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'ProjectRole' failed to initialize correctly", dod.getRandomProjectRole());
        ProjectRole obj = dod.getNewTransientProjectRole(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ProjectRole' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ProjectRole' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'ProjectRole' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ProjectRoleIntegrationTest.testRemove() {
        ProjectRole obj = dod.getRandomProjectRole();
        Assert.assertNotNull("Data on demand for 'ProjectRole' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ProjectRole' failed to provide an identifier", id);
        obj = ProjectRole.findProjectRole(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'ProjectRole' with identifier '" + id + "'", ProjectRole.findProjectRole(id));
    }
    
}
