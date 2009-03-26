package org.riotfamily.example.petstore;

import java.util.HashMap;

import org.riotfamily.common.util.RiotLog;
import org.riotfamily.forms.Form;
import org.riotfamily.forms.element.Checkbox;
import org.riotfamily.riot.list.command.dialog.DialogCommand;
import org.riotfamily.riot.list.ui.ListSession;
import org.springframework.web.servlet.ModelAndView;

public class PetCommand extends DialogCommand {

	private RiotLog log = RiotLog.get(this);
	
	@Override
	public Form createForm(Object bean) {
		Form form = new Form(HashMap.class);
		form.addElement(new Checkbox(), "foo");
		form.addButton("ok");
		form.addButton("cancel");
		return form;
	}
	
	@Override
	public ModelAndView handleInput(Object input, String button, Object bean, 
			ListSession listSession) {

		log.info("[%s]: %s", button, input);
		return null;
	}
}
