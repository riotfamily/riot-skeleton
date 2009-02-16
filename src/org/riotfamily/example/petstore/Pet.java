package org.riotfamily.example.petstore;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.riotfamily.media.model.RiotImage;
import org.riotfamily.riot.hibernate.domain.ActiveRecordSupport;
import org.riotfamily.website.cache.TagCacheItems;

@Entity
@TagCacheItems
public class Pet extends ActiveRecordSupport {

	private String name;
	
	private RiotImage image;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static List<Pet> loadAll() {
		return find("from Pet");
	}

	@ManyToOne
	@Cascade(CascadeType.SAVE_UPDATE)
	public RiotImage getImage() {
		return image;
	}

	public void setImage(RiotImage image) {
		this.image = image;
	}
	
}
