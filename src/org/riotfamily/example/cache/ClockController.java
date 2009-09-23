package org.riotfamily.example.cache;

import java.io.Writer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClockController {

	@RequestMapping("/clock")
	public void handleRequest(Writer out) throws Exception {
		out.write(String.valueOf(System.currentTimeMillis()));
	}

}
