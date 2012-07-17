// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.saic.tmr.domain;

import com.saic.tmr.domain.Award;
import com.saic.tmr.domain.AwardDataOnDemand;
import com.saic.tmr.domain.AwardIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AwardIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AwardIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AwardIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: AwardIntegrationTest: @Transactional;
    
    @Autowired
    private AwardDataOnDemand AwardIntegrationTest.dod;
    
    @Test
    public void AwardIntegrationTest.testCountAwards() {
        Assert.assertNotNull("Data on demand for 'Award' failed to initialize correctly", dod.getRandomAward());
        long count = Award.countAwards();
        Assert.assertTrue("Counter for 'Award' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AwardIntegrationTest.testFindAward() {
        Award obj = dod.getRandomAward();
        Assert.assertNotNull("Data on demand for 'Award' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Award' failed to provide an identifier", id);
        obj = Award.findAward(id);
        Assert.assertNotNull("Find method for 'Award' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Award' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void AwardIntegrationTest.testFindAllAwards() {
        Assert.assertNotNull("Data on demand for 'Award' failed to initialize correctly", dod.getRandomAward());
        long count = Award.countAwards();
        Assert.assertTrue("Too expensive to perform a find all test for 'Award', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Award> result = Award.findAllAwards();
        Assert.assertNotNull("Find all method for 'Award' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Award' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AwardIntegrationTest.testFindAwardEntries() {
        Assert.assertNotNull("Data on demand for 'Award' failed to initialize correctly", dod.getRandomAward());
        long count = Award.countAwards();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Award> result = Award.findAwardEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Award' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Award' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void AwardIntegrationTest.testFlush() {
        Award obj = dod.getRandomAward();
        Assert.assertNotNull("Data on demand for 'Award' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Award' failed to provide an identifier", id);
        obj = Award.findAward(id);
        Assert.assertNotNull("Find method for 'Award' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAward(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Award' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AwardIntegrationTest.testMergeUpdate() {
        Award obj = dod.getRandomAward();
        Assert.assertNotNull("Data on demand for 'Award' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Award' failed to provide an identifier", id);
        obj = Award.findAward(id);
        boolean modified =  dod.modifyAward(obj);
        Integer currentVersion = obj.getVersion();
        Award merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Award' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AwardIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Award' failed to initialize correctly", dod.getRandomAward());
        Award obj = dod.getNewTransientAward(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Award' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Award' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Award' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void AwardIntegrationTest.testRemove() {
        Award obj = dod.getRandomAward();
        Assert.assertNotNull("Data on demand for 'Award' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Award' failed to provide an identifier", id);
        obj = Award.findAward(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Award' with identifier '" + id + "'", Award.findAward(id));
    }
    
}
