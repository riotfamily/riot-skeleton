package org.riotfamily.example.petstore;

import java.util.Collection;

import org.riotfamily.pages.mapping.VirtualPageResolver;
import org.riotfamily.pages.model.Page;

public class PetPageResolver extends VirtualPageResolver<Pet> {

	@Override
	protected Pet load(String pathComponent) {
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
		return Pet.loadAll();
	}

}
