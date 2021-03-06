// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tuc.capacity.entity;

import com.tuc.capacity.entity.SowAllocation;
import com.tuc.capacity.entity.SowAllocationDataOnDemand;
import com.tuc.capacity.entity.SowAllocationIntegrationTest;
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

privileged aspect SowAllocationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SowAllocationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SowAllocationIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: SowAllocationIntegrationTest: @Transactional;
    
    @Autowired
    SowAllocationDataOnDemand SowAllocationIntegrationTest.dod;
    
    @Test
    public void SowAllocationIntegrationTest.testCountSowAllocations() {
        Assert.assertNotNull("Data on demand for 'SowAllocation' failed to initialize correctly", dod.getRandomSowAllocation());
        long count = SowAllocation.countSowAllocations();
        Assert.assertTrue("Counter for 'SowAllocation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SowAllocationIntegrationTest.testFindSowAllocation() {
        SowAllocation obj = dod.getRandomSowAllocation();
        Assert.assertNotNull("Data on demand for 'SowAllocation' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SowAllocation' failed to provide an identifier", id);
        obj = SowAllocation.findSowAllocation(id);
        Assert.assertNotNull("Find method for 'SowAllocation' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'SowAllocation' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void SowAllocationIntegrationTest.testFindAllSowAllocations() {
        Assert.assertNotNull("Data on demand for 'SowAllocation' failed to initialize correctly", dod.getRandomSowAllocation());
        long count = SowAllocation.countSowAllocations();
        Assert.assertTrue("Too expensive to perform a find all test for 'SowAllocation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<SowAllocation> result = SowAllocation.findAllSowAllocations();
        Assert.assertNotNull("Find all method for 'SowAllocation' illegally returned null", result);
        Assert.assertTrue("Find all method for 'SowAllocation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SowAllocationIntegrationTest.testFindSowAllocationEntries() {
        Assert.assertNotNull("Data on demand for 'SowAllocation' failed to initialize correctly", dod.getRandomSowAllocation());
        long count = SowAllocation.countSowAllocations();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<SowAllocation> result = SowAllocation.findSowAllocationEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'SowAllocation' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'SowAllocation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SowAllocationIntegrationTest.testFlush() {
        SowAllocation obj = dod.getRandomSowAllocation();
        Assert.assertNotNull("Data on demand for 'SowAllocation' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SowAllocation' failed to provide an identifier", id);
        obj = SowAllocation.findSowAllocation(id);
        Assert.assertNotNull("Find method for 'SowAllocation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifySowAllocation(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'SowAllocation' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SowAllocationIntegrationTest.testMergeUpdate() {
        SowAllocation obj = dod.getRandomSowAllocation();
        Assert.assertNotNull("Data on demand for 'SowAllocation' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SowAllocation' failed to provide an identifier", id);
        obj = SowAllocation.findSowAllocation(id);
        boolean modified =  dod.modifySowAllocation(obj);
        Integer currentVersion = obj.getVersion();
        SowAllocation merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'SowAllocation' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SowAllocationIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'SowAllocation' failed to initialize correctly", dod.getRandomSowAllocation());
        SowAllocation obj = dod.getNewTransientSowAllocation(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'SowAllocation' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'SowAllocation' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'SowAllocation' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void SowAllocationIntegrationTest.testRemove() {
        SowAllocation obj = dod.getRandomSowAllocation();
        Assert.assertNotNull("Data on demand for 'SowAllocation' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SowAllocation' failed to provide an identifier", id);
        obj = SowAllocation.findSowAllocation(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'SowAllocation' with identifier '" + id + "'", SowAllocation.findSowAllocation(id));
    }
    
}
