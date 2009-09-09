package org.riotfamily.example.petstore;

import java.io.File;
import java.io.IOException;

import org.hibernate.Session;
import org.riotfamily.common.hibernate.TypedEntityListener;
import org.riotfamily.common.image.Thumbnailer;
import org.riotfamily.media.model.RiotImage;

public class PetListener extends TypedEntityListener<Pet> {
	
	private Thumbnailer thumbnailer;
	
	public PetListener(Thumbnailer thumbnailer) {
		this.thumbnailer = thumbnailer;
	}

	protected void entitySaved(Pet pet, Session session) throws IOException {
		updateThumbnail(pet);
	}
	
	protected void entityUpdated(Pet old, Pet pet, Session session) throws IOException {
		updateThumbnail(pet);
	}
	
	private void updateThumbnail(Pet pet) throws IOException {
		RiotImage img = pet.getImage();
		if (img != null) {
			if (img.get("thumbnail") == null) {
				img.addVariant("thumbnail", createThumbnail(img));
			}
		}
	}
	
	private RiotImage createThumbnail(RiotImage img) throws IOException {
		RiotImage thumb = new RiotImage();
		File source = img.getFile();
		File dest = thumb.createEmptyFile(img.getFileName());
		thumbnailer.renderThumbnail(source, dest, 80, 80, true, null);
		thumb.updateMetaData();
		return thumb;
	}
}
