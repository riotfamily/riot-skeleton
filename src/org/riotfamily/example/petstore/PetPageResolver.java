package org.riotfamily.example.petstore;

import java.util.Collection;

import org.riotfamily.pages.mapping.VirtualPageResolver;
import org.riotfamily.pages.model.Page;

public class PetPageResolver extends VirtualPageResolver<Pet> {

	@Override
	protected Pet load(Page parent, String pathComponent) {
		return Pet.load(Long.valueOf(pathComponent));
	}
	
	@Override
	protected String getPathComponent(Pet pet) {
		return pet.getId().toString();
	}
	
	@Override
	protected String getTitle(Pet pet) {
		return pet.getName();
	}
	
	@Override
	protected Collection<Pet> getChildren(Page parent) {
		if ("pets".equals(parent.getPageType().getName())) {
			return Pet.loadAll();
		}
		return null;
	}

}
