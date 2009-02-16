package org.riotfamily.example.petstore;

import java.io.File;
import java.io.IOException;

import org.riotfamily.common.image.Thumbnailer;
import org.riotfamily.media.model.RiotImage;
import org.riotfamily.riot.hibernate.interceptor.EntityListener;

public class PetListener implements EntityListener<Pet> {
	
	private Thumbnailer thumbnailer;
	
	public PetListener(Thumbnailer thumbnailer) {
		this.thumbnailer = thumbnailer;
	}

	public void onSave(Pet pet) throws IOException {
		updateThumbnail(pet);
	}
	
	public void onUpdate(Pet pet) throws IOException {
		updateThumbnail(pet);
	}
	
	public void onDelete(Pet pet) {
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
		thumb.update();
		return thumb;
	}
}
