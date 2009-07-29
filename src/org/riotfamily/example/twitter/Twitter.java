package org.riotfamily.example.twitter;

import java.util.List;

import net.sf.json.JSONArray;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;

public class Twitter {

	HttpClient client = new HttpClient();
	
	public List<?> getTimeline(String id) throws Exception {
		String url = "http://twitter.com/statuses/user_timeline.json?id=" + id;
		GetMethod get = new GetMethod(url);
		try {
			client.executeMethod(get);
			String json = get.getResponseBodyAsString();
			return JSONArray.fromObject(json).subList(0, 5);
		}
		finally {
			get.releaseConnection();
		}
	}

}
