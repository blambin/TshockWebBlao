package common;

import java.util.UUID;

public class UUIDUtil {

	public static String generateUUIDKey(){
		String uuid = UUID.randomUUID().toString();
		return uuid.replace("-", "");
	}
}
