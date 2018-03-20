package total.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WriterPageController {
	
	@RequestMapping("/@{id}")
	public void writerPageHandle(@PathVariable String id) {
		System.out.println("돼???");
	}
}
