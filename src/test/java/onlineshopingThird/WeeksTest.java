package onlineshopingThird;

import static org.junit.Assert.*;

import org.hamcrest.Matchers;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.mum.onlineshoping.OnlineShoppingApplication;
import edu.mum.onlineshoping.service.VendorService;


@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OnlineShoppingApplication.class)
@WebAppConfiguration
public class WeeksTest {
	@Autowired
	VendorService vendorService;

	@Test
	public void test() {
		assertNotNull(vendorService.findWeeks("vendor").size());
		assertEquals(0,vendorService.findWeeks("jfxj").size());
		assertEquals(2,vendorService.findWeeks("vendor1").size());
	}

}
