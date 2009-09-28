package org.riotfamily.example.cache;

import java.io.Writer;

import org.riotfamily.common.web.cache.annotation.Cache;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("clock")
@Cache(ttl="30s")
public class ClockController {

	@RequestMapping("/clock")
	public void handleRequest(Writer out) throws Exception {
		out.write(String.valueOf(System.currentTimeMillis()));
	}

}
